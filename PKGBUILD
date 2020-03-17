# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria-git
_pkgname=Limnoria
pkgver=20200131.11218.2f493625
pkgrel=1
pkgdesc="An IRC bot based on Supybot, with sqlite3 support and other features (dev channel)"
arch=('any')
url="https://github.com/ProgVal/Limnoria"
license=('3-clause BSD')
depends=('python>=3.4')
makedepends=('git')
optdepends=("python-charade: Detect page's encoding"
    "python-pytz: Enable Time plugin to calculate the time in specified timezone"
    "python-dateutil: Enable Time plugin to parse the input time string"
    "python-gnupg: GnuPG support"
    "python-feedparser: RSS plugin support"
    "python-sqlalchemy: Aka plugin support"
    "python-pysocks: SOCKS proxy support"
    "python-mock: For testing only"
    "python-cryptography: ECDSA support")
conflicts=('limnoria' 'limnoria-python3' 'limnoria-python3-git')
source=("git://github.com/ProgVal/$_pkgname.git")
md5sums=('SKIP')
install=".install"

pkgver() {
    cd "${srcdir}/${_pkgname}"
    timestamp="$(git log -n1 --format="%at")"
    maj="$(date +"%Y%m%d" --date="@${timestamp}" -u)"
    min="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    echo "${maj}.${min}"
}

build() {
    cd "$srcdir/$_pkgname"

    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname"

    python3 setup.py install --root="$pkgdir" || return 1
}
