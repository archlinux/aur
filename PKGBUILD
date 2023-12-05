# Maintainer: Georgiy Tugai <georgiy.tugai@gmail.com>
# Maintainer: ssfdust <ssfdust@gmail.com>
pkgname=lieer-git
pkgver=v1.6.20231203.e41c966
pkgrel=1
pkgdesc="Fast fetch and two-way tag synchronization between notmuch and GMail"
arch=(any)
url="https://github.com/gauteh/lieer"
license=('GPL3')
groups=()
depends=('python' 'python-tqdm' 'python-google-api-python-client'
         'python-oauth2client' 'python-google-auth-oauthlib' 'notmuch>=0.25')
makedepends=('git' 'python-pip' 'python-installer' 'python-wheel')
optdepends=()
provides=("${pkgname%-git}" "gmai${pkgname%-git}" "gmai${pkgname}")
conflicts=("${pkgname%-git}" "gmai${pkgname%-git}" "gmai${pkgname}")
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("$pkgname::git+https://github.com/gauteh/lieer.git")
md5sums=('SKIP')
noextract=()

pkgver() {
    (
        set -o pipefail
        cd "$srcdir/$pkgname"

        printf "v%s.%s.%s" \
            "$(grep -oP 'version="\K[^"]+' setup.py)" \
            "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d)" \
            "$(git rev-parse --short HEAD)"
    )
}

build () {
    cd "$srcdir/$pkgname"
    pip wheel --no-deps -w "dists" .
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir/" dists/*.whl
}

# vim:set ts=4 sw=4 et:
