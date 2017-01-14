# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

_gitname=axoloti
pkgname=${_gitname}-git
pkgver=1.0.11.r61.g6a05b1c2
pkgrel=1
pkgdesc='A workbench to compose and edit sound algorithms and interactions for the axoloti core'
arch=(x86_64)
url="http://www.axoloti.com/"
license=(GPL)
depends=('java-runtime=7' 'axoloti-runtime>=1.0')
makedepends=(apache-ant libtool automake autoconf)
provides=(axoloti)
conflicts=(axoloti)

source=('git+https://github.com/axoloti/axoloti.git' 'axoloti.sh')

sha512sums=(
  SKIP
  d3df8647a7adb5df40549fe8f81579df11cbe409527f42101d5a1948102895afbd764ee0b7dfb53f56694aea4ba0b1ffeadee012d7b36a9c032d686e1586a0b3
)

build() {
    echo '##### building GUI... #####'
    cd "$srcdir/$_gitname"
    ant
}

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm644 "$srcdir/$_gitname/platform_linux/49-axoloti.rules" \
        "$pkgdir/etc/udev/rules.d/49-axoloti.rules"
    install -Dm644 "$srcdir/$_gitname/dist/Axoloti.jar" \
        "$pkgdir/usr/share/$_gitname/Axoloti.jar"
    install -Dm755 "$srcdir/axoloti.sh" "$pkgdir/usr/bin/axoloti"
    install -Dm644 "$srcdir/$_gitname/license.txt" "$pkgdir/usr/share/licenses/axoloti/license.txt"
}
