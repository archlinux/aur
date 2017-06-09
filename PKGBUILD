#Mainteiner: Wagner <wagn3r@ya.ru>
pkgname=tomita-parser
pkgver=1.0.73
pkgdesc="GLR parser"
pkgrel=1
url="https://tech.yandex.ru/tomita/"
arch=("x86_64" "i686")
license=("MPL-2.0")
depends=("libmystem")
makedepends=("gcc>=4.81" "cmake>=2.8" "lua>=5.2")
source=("git+https://github.com/yandex/tomita-parser.git")
md5sums=('SKIP')
build(){
        cd "${srcdir}/${pkgname}"
        mkdir -p build
        cd build
        sed -i 's|libPath += Stroka("libmystem_c_binding.so");|libPath = Stroka("/usr/lib/libmystem_c_binding.so");|g' "${srcdir}/${pkgname}/src/FactExtract/Parser/lemmerlib/extlemmer.cpp"
        cmake ../src/ -DCMAKE_BUILD_TYPE=Release
        make
}

package() {
        cd "${srcdir}/${pkgname}/build"
        mkdir -p "${pkgdir}/usr/bin"
        cp bin/tomita-parser "${pkgdir}/usr/bin/tomita"
        install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
