# Maintainer: Sick Codes <info at sick dot codes>

pkgname=dumpifs-git
_pkgname=${pkgname%-*}
pkgver=5.15
pkgrel=1
pkgdesc='Dirty hack dumpifs. Modified to be compiled on most platform without QNX SQP.'
arch=('i686' 'x86_64')
url='https://github.com/askac/dumpifs'
license=('custom:BLACKBERRY SDK')
depends=('clang')
provides=(dumpifs fixdecifs fixencifs uuu zzz exMifsLzo exMifsLz4)
# source=("git+${url}.git#commit=b7bac90e8312eca2796f2003a52791899eb8dcd9"
source=("git+${url}.git"
    "https://github.com/askac/dumpifs/commit/eb6c695e1a2a79967935b4cea07695141ba60336.patch")
md5sums=('SKIP'
         '316c7cfd59026430ba124755ef1e0d0b')

build() {

    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "$srcdir/${_pkgname}"

    install -dm755 "${pkgdir}/usr/bin/"  

    for binary in "${provides[@]}"; do
      install -D -m644 "${binary}" "${pkgdir}/usr/bin/${binary}"
      chmod a+x "${pkgdir}/usr/bin/${binary}"
    done

}
