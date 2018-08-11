# Mantainer: Alberto Santini <alberto.santini at upf dot edu>

pkgname='program-options'
pkgdesc='Header-only programme options library for C++.'
pkgver='0.1.0'
pkgrel='1'
arch=('any')
url='https://github.com/Fytch/ProgramOptions.hxx'
license=('MIT')
checkdepends=('cmake>=2.8.8')
source=('ProgramOptions.hxx.v0.1.0.tar.gz::https://github.com/Fytch/ProgramOptions.hxx/archive/v0.1.0.tar.gz')
md5sums=('49ded27318cf27f4022a061ce0182167')

# Floating point infinity/NaN tests would fail if the user has
# -Ofast in his CXXFFLAGS
options=('!buildflags')

_extract_dir='ProgramOptions.hxx-0.1.0'

check() {
    cd "$srcdir/$_extract_dir"
    mkdir -p test-build
    cd test-build
    cmake ..
    make Test
    ./Test
}

package() {
    cd "$srcdir/$_extract_dir"

    install -dm755 "$pkgdir/usr/include"
    install -m644 ProgramOptions.hxx "$pkgdir/usr/include"

    install -dm755 "$pkgdir/usr/share/doc/$pkgname/examples"
    install -m644 examples/*.cxx "$pkgdir/usr/share/doc/$pkgname/examples"
}