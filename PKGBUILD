# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=quickcut-git
_pkgname=${pkgname%-git}
_gitname=QuickCut
pkgver=v1.6.9.r1.g3db7bef
pkgrel=1
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
         'python-pymediainfo'
         'you-get'
         'youtube-dl')
makedepends=('git' 'icoutils')
provides=('quickcut' 'quickcut-bin')
conflicts=('quickcut' 'quickcut-bin')
source=("git+https://github.com/HaujetZhao/QuickCut")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_gitname

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

 # icon
  icotool -x QuickCut/QuickCut/icon.ico
  install -Dm644 icon_*_32x32x32.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # desktop entry
  install -dm755  ${pkgdir}/usr/share/applications/
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
