# Maintainer : Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# This is a header-only library. No dependecy is needed and no build is necessary.
# If you want to build the checks/tests, uncomment the blocks in checkdepends, build() and check().

pkgname=fp16-git
pkgver=r40.34d4bf0
pkgrel=1
pkgdesc='Header-only library for conversion to/from half-precision floating point formats (git version)'
arch=('any')
url='https://github.com/Maratyszcza/FP16/'
license=('MIT')
makedepends=('git')
#checkdepends=(
#     official repositories:
#        'python2' 'ninja'
#     AUR:
#        'confu2-git' 'python2-peachpy-git'
#)
source=("$pkgname"::'git+https://github.com/Maratyszcza/FP16.git')
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
#    sed -i '/peachpy[[:space:]]=[[:space:]]python/s/python/python2/' build.ninja # use python2
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
    cd "$pkgname"
    
    # directories creation
    mkdir -p "${pkgdir}/usr/include/fp16"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # include
    install -D -m644 include/*.h      "${pkgdir}/usr/include"
    install -D -m644 include/fp16/*.h "${pkgdir}/usr/include/fp16"
    
    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
