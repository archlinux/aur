# Maintainer: Sergey Alexeyev s.n.alexeyev@gamil.com

author=s-n-alexeyev
pkgname=torctl-gui
_gitname=torctl-gui
pkgver=v1.1.0.r0.ga2b44e5
pkgrel=1
pkgdesc='The script serves as a graphical interface for torctl/tor'
arch=('any')
url='https://github.com/s-n-alexeyev/torctl-gui'
license=('GPL3')
depends=('torctl' 'tor' 'yad' 'macchanger' 'iproute2' 'pam' 'libnotify' 'systemd')
makedepends=('git' 'coreutils' 'make' 'fakeroot' 'gcc')
provides=('torctl-gui')
source=("git+https://github.com/$author/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 755 "$_gitname" "$pkgdir/usr/bin/$_gitname"
  install -Dm 644 "$srcdir/$_gitname/tor.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  cat<<EOF>>"$srcdir/$_gitname/$pkgname.desktop"
[Desktop Entry]
Name=Managing tor/torctl
Name[ru]=Управление tor/torctl
Comment=The script serves as a graphical interface for torctl/tor
Comment[ru]=Скрипт является графической оболочкой для torctl/tor
GenericName=torctl-gui
GenericName[ru]=torctl-gui
Categories=Utils;
Type=Application
Exec=torctl-gui %F
Icon=tor
StartupNotify=true
Terminal=false
Keywords[ru]=tor;torctl;
Keywords=tor;torctl;
EOF

  install -Dm 644 "$srcdir/$_gitname/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

}


