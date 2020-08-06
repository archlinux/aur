# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=quickcut-git
_pkgname=${pkgname%-git}
_gitname=QuickCut
pkgver=v1.3.0.r7.gd6eb81a
pkgrel=4
pkgdesc="Your most handy video processing software."
arch=('x86_64' 'i686')
url="https://github.com/HaujetZhao/QuickCut"
license=('MPL')
depends=('ffmpeg'
         'python-srt'
         'python-keyboard'
         'python-numpy'
         'python-setuptools'
         'python-aliyun-python-sdk-core'
         'python-pyqt5'
         'python-audiotsm'
         'python-scipy'
         'python-pyaudio'
         'python-oss2'
         'python-cos-python-sdk-v5'
         'python-tencentcloud-sdk-python'
         'python-alibabacloud-nls-python-sdk'
         'python-auditok'
         'python-pymediainfo')
makedepends=('git' 'icoutils')
provides=('quickcut' 'quickcut-bin')
conflicts=('quickcut' 'quickcut-bin')
source=("git+https://github.com/HaujetZhao/QuickCut"
        "${_pkgname}.sh")
sha256sums=('SKIP'
            '65e15d5675c1faa54c1d1ae38649a39a2fbb97aed688d8b0db295856ab2e66ae')

package() {
  cd $_gitname

  # Shebang &   # ugly hack
  sed -i '1i #!/usr/bin/python' QuickCut.py
  sed -i 's|icon.icns|/usr/lib/quickcut/icon.icns|g' QuickCut.py

  # install
  install -Dm755 QuickCut.py ${pkgdir}/usr/lib/${_pkgname}/QuickCut.py
  install -Dm644  icon.icns ${pkgdir}/usr/lib/${_pkgname}/icon.icns
  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/share/pixmaps
  install -dm755 ${pkgdir}/usr/share/applications
  
  # sh
  install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}

  # icon
  icotool -x icon.ico
  install -Dm644 icon_*_32x32x32.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # other
  mv languages ${pkgdir}/usr/lib/${_pkgname}/

  # themes
  cp style.css ${pkgdir}/usr/lib/${_pkgname}/

  # desktop entry
  cat > ${pkgdir}/usr/share/applications/${_pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=QuickCut
Comment=video processing software
Exec=quickcut
Icon=quickcut
Terminal=false
EOF

}

# vim: set sw=2 ts=2 et:
