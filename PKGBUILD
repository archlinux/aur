# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# This is a header-only library. No dependecy is needed and no build is necessary.
# If you want to build the checks/tests, uncomment the blocks in makedepends, build() and check().

pkgname=fxdiv-git
pkgver=r36.8f85044
pkgrel=1
pkgdesc="Header-only library for division via fixed-point multiplication by inverse (git version)"
arch=('any')
url="https://github.com/Maratyszcza/FXdiv/"
license=('MIT')
makedepends=('git'
    # for building checks:
        #'python2' 'ninja' # binary repositories
        #'confu2-git'      # AUR
)
source=("$pkgname"::"git+https://github.com/Maratyszcza/FXdiv.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# uncomment this block to build and run the checks/tests
#build() {
#    cd "$pkgname"
#    
#    confu2 setup
#    python2 ./configure.py
#    ninja
#}
#
#check() {
#    cd "${pkgname}/bin"
#    for _test in *
#    do
#        msg2 "Running test '${_test}'..."
#        ./"$_test"
#    done
#}

package() {
    cd "${pkgname}"
    
    # directories creation
    mkdir -p "${pkgdir}/usr/include"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # include
    install -D -m644 include/*.h "${pkgdir}/usr/include"
    
    # license
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
