# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
pkgbase=dogelog
pkgname=(dogelog-js dogelog-py dogelog-java dogelog-license dogelog)
pkgver=1.3.0
pkgrel=1
arch=(any)
url='https://www.dogelog.ch/'
pkgdesc='The avant-garde of logic programming'
license=(custom)
options=(!strip)
source=(
    https://www.dogelog.ch/typtab/rscsrv/docs/50_archive/archive_1_3/dogelog_1_3_0.zip
    https://www.xlog.ch/izytab/rscsrv/en/docs/25_recital/17_runtime.pdf
    https://www.xlog.ch/izytab/rscsrv/en/docs/25_recital/81_conditions.pdf
)
# Checksum is from https://www.dogelog.ch/typtab/moblet/docs/50_archive/archive_1_3/dogelog_1_3_0.html
sha256sums=(
    3d666dbd07e5caabd8b56296c45e4f05a4b0b292c460b93d9e5093aa3a6e8f96
    ab0388caeda85ad41a4e19a096fb92cf319aaf7ead3041c27f4a4a264e9361b3
    e00f26995e012646b0dffba4c4cdc604d87458b422b4f72aae6f382dff7ec5af
)
changelog=ChangeLog

package_any() {
    install --mode=644 -Dt "$pkgdir/usr/share/$pkgbase" "$1"
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
    optdepends=(rlwrap)
    license=(GPL-2.0-or-later)
    install -m755 -D ../dogelog.sh "$pkgdir/usr/bin/$pkgbase"
}

package_dogelog-license() {
    pkgdesc='The avant-garde of logic programming (License agreement)'
    license=()
    install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgbase" ../17_runtime.pdf ../81_conditions.pdf
}
