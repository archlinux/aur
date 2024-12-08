# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
pkgbase=dogelog
pkgname=(dogelog-js dogelog-py dogelog-java dogelog-license dogelog)
pkgver=1.2.5
pkgrel=5
arch=(any)
url='https://www.dogelog.ch/'
pkgdesc='The avant-garde of logic programming'
license=(custom)
options=(!strip)
source=(https://www.dogelog.ch/typtab/rscsrv/docs/50_archive/archive_1_2/dogelog_1_2_5.zip)
sha256sums=('ac929e3662f3bb539d47d12c81004b1d48b6e7cf800f93353d04905854a25a61')

package_any() {
    install --mode=655 -Dt "$pkgdir/usr/share/$pkgbase" "$1"
}

package_dogelog-py() {
    pkgdesc='The avant-garde of logic programming (Python backend)'
    depends=(dogelog-license)
    optdepends=('python3>=3.10.14' pypy3)
    provides=(dogelog-package)
    package_any playerpy/canned/dogelog.py
}

package_dogelog-js() {
    pkgdesc='The avant-garde of logic programming (JavaScript backend)'
    depends=(dogelog-license)
    optdepends=('nodejs>=22.11.0' bun)
    provides=(dogelog-package)
    replaces=(dogelog-node)
    package_any player/canned/dogelog.mjs
}

package_dogelog-java() {
    pkgdesc='The avant-garde of logic programming (Java backend)'
    depends=('java-runtime>=21' dogelog-license)
    provides=(dogelog-package)
    package_any playerj/canned/dogelog.zip
}

package_dogelog() {
    pkgdesc='The avant-garde of logic programming (Shell wrapper)'
    depends=(dogelog-package)
    license=(GPL-2.0-or-later)
    install -m755 -D ../dogelog.sh "$pkgdir/usr/bin/$pkgbase"
}

package_dogelog-license() {
    pkgdesc='The avant-garde of logic programming (License agreement)'
    license=()
    install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgbase" ../LICENSE
}
