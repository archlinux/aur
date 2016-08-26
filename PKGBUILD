pkgname=('log4cplus-git')
_srcname='log4cplus'
pkgver='r1'
pkgrel='1'
pkgdesc='Simple to use C++ logging API providing thread-safe, flexible, and arbitrarily granular control over log management and configuration'
arch=('i686' 'x86_64')
url="https://github.com/log4cplus/${_srcname}"
license=('custom:BSD' 'Apache')

depends=('gcc-libs')
makedepends=('git' 'gcc-libs')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

build() {
    cd "${srcdir}/${_srcname}"

    autoreconf --install --force --warnings='all'
    ./configure --prefix='/usr' --with-working-locale

    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make DESTDIR="${pkgdir}" install
}
