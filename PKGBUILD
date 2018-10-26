# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# This is a header-only library. No dependecy is needed and no build is necessary.
# If you want to build the checks/tests, uncomment the blocks in checkdepends, build() and check().

pkgname=fxdiv-git
pkgver=r51.811b482
pkgrel=2
pkgdesc='Header-only library for division via fixed-point multiplication by inverse (git version)'
arch=('any')
url='https://github.com/Maratyszcza/FXdiv/'
license=('MIT')
makedepends=('git')
#checkdepends=(
#     official repositories:
#        'python2' 'ninja'
#     AUR:
#        'confu2-git'
#)
provides=('fxdiv')
conflicts=('fxdiv')
source=("$pkgname"::'git+https://github.com/Maratyszcza/FXdiv.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# uncomment this block to build and run the checks/tests
#build() {
#    cd "$pkgname"
#    confu2 setup
#    python2 ./configure.py
#    ninja
#}
#
#check() {
#    cd "${pkgname}/bin"
#    local _test
#    for _test in *
#    do
#        printf '%s\n' "  -> Running test '${_test}'..."
#        ./"$_test"
#    done
#}

package() {
    cd "${pkgname}"
    
    # headers
    mkdir -p "${pkgdir}/usr/include"
    install -D -m644 include/*.h "${pkgdir}/usr/include"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
