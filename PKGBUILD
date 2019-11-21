# Maintainer: Martoko <mbastholm at gmail dot com>

pkgname=fsharp-fslexyacc
pkgver=10.0.0
pkgrel=1
pkgdesc='Tools for FsLex/FsYacc lexer/parser generation tools'
arch=('any')
url='https://fsprojects.github.io/FsLexYacc/'
options=('!strip')
license=('apache')
depends=('mono')
makedepends=('nuget')
source=('fslex' 'fsyacc')
sha512sums=('f03037fa6819ae8c83d0e244a0ce7bb1587116b69b6918fb93705a482e3ccb5393a8733e91548d557da6fc329c175d9452d7512ca47f4fd41c224ce3a247aea4'
            '82628945f3e187477546339bdfcee6b6325d1df884dcb4d4b0c9060fb1289c2f283cbc0a08a1830489207e14b7f4e9d41be2e1ce001c3a089206e9c3a98ea577')

build() {
  nuget install FsLexYacc -Version ${pkgver}
}

package() {
  pushd "${srcdir}/FsLexYacc.${pkgver}/build"
  install -Dm644 "fslex/net46/FsLexYacc.Runtime.dll" "${pkgdir}/usr/lib/mono/fsharp/FsLexYacc.Runtime.dll"
  install -Dm644 "fslex/net46/fslex.exe" "${pkgdir}/usr/lib/mono/fsharp/fslex.exe"
  install -Dm644 "fsyacc/net46/fsyacc.exe" "${pkgdir}/usr/lib/mono/fsharp/fsyacc.exe"
  popd

  install -Dm755 "${srcdir}/fsyacc" "${pkgdir}/usr/bin/fsyacc"
  install -Dm755 "${srcdir}/fslex" "${pkgdir}/usr/bin/fslex"
}
