pkgname=mod_auth_cas-git
_gitname=${pkgname%-git}
pkgver=r373.eb3537a
pkgrel=1
pkgdesc="Apache CAS Authentication Module for the JASIG/Apereo CAS Server."
arch=('x86_64')
url="https://github.com/apereo/mod_auth_cas"
license=('Apache License, Version 2.0')
depends=('apache')
makedepends=('git' 'openssl')
source=("git+https://github.com/apereo/mod_auth_cas.git")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    autoreconf -ivf
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" install
}

# vim: ts=4 sts=4 sw=4 et
