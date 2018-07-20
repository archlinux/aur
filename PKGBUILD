# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='qt-online-installer'
_pkgname='qt-online-installer'
pkgver=r2.a1f624d
_pkgverminor=3.0.5
pkgrel=1
pkgdesc="Qt Online Installer for the optimal Qt installation experience."
arch=('x86_64')
url="https://www.qt.io/download"
license=('GPL-3.0')
source=("http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run"
        "qt-online-installer.desktop"
        "qt-online-installer.svg") 
#"/mnt/D/Document/WorkSpace/Packages/AUR/qt-online-installer/sources.tar.gz"  #"http://ftp.jaist.ac.jp/pub/qtproject/archive/online_installers/${pkgver}/qt-unified-linux-x64-$_pkgverminor-online.run")
# source_i686=("http://ftp.jaist.ac.jp/pub/qtproject/archive/online_installers/${pkgver}/qt-unified-linux-x32-$_pkgverminor-online.run")
sha256sums=('3926eff634f7a798bd8f7f8a3625d8e9db8179e7efaf4c59eeff9f1eae7e95f5'
            'b033313135bb37fc14d26c8e5df2b48082e1bdd5b98893edd004706bd60d037c'
            '77bfaf98cf7734451e794f5bffd152e8b51d21d0d4114c64328ad7cf27aec4dc')
# sha256sums_i686=('SKIP')

pkgver() {
  cd "$srcdir"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd $srcdir

  _pkg=linux-x64
  if [ "${CARCH}" = "i686" ]; then
    _pkg=linux-x32
  fi

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

#   cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R
#   cp $srcdir/QEELauncher.sh ${pkgdir}/opt/${_pkgname}
#   cp $srcdir/${pkgname}.svg ${pkgdir}/usr/share/icons/${pkgname}
#   cp $srcdir/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}

  # ln -s /opt/${pkgname}/MyQxEntityEditorLauncher.sh "${pkgdir}"/usr/bin/MyQxEntityEditorLauncher.sh
  install -Dm644 ${srcdir}/qt-unified-linux-x64-online.run ${pkgdir}/usr/bin/qt-unified-linux-x64-online.run
  install -Dm755 ${srcdir}/${pkgname}.svg ${pkgdir}/usr/share/icons/${pkgname}.svg
  install -Dm755 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  chmod +x ${pkgdir}/usr/bin/qt-unified-linux-x64-online.run
}