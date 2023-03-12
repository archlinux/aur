# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=rustdesk-server-bin
_pkgname=rustdesk-server
pkgver=1.1.7_2
pkgrel=1
pkgdesc="RustDesk Server Program"
arch=('x86_64' 'aarch64')
url="https://github.com/rustdesk/rustdesk-server"
license=('AGPL3')
provides=(${_pkgname})
conflicts=("rustdesk-server-demo")
source=(
"${_pkgname}-hbbs.service"
"${_pkgname}-hbbr.service"
"${_pkgname}.sysusers"
"${_pkgname}.tmpfiles"
)
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::${url}/releases/download/${pkgver/_/-}/${_pkgname}-linux-amd64.zip")
source_aarch64=("${_pkgname}-${pkgver}-arm64.zip::${url}/releases/download/${pkgver/_/-}/${_pkgname}-linux-arm64v8.zip")

sha256sums=('ab4826703bfa96f5371f02fcb4575fff435554d575213cedca8cb1f39564601e'
            'bf6bdb07ae69d6cfde433781f23376036cb9ad2f1bc1fc7ee44bd56de38ad11d'
            '09d880c1c7987e9e7262c9f2fb56120d14b708238f3c7f14c800e6234b798440'
            'bdea355562f43f6045e2b52f6dbb4d84ffffa1efec464446b2b2e10e336d6ddb')
sha256sums_x86_64=('1a7a52b792c66f12c02024a36d0b5d61f259e7b2410a7cbf889eaf2e540ceaa4')
sha256sums_aarch64=('2d06f27a8a826c5cb497242e5d002193796b0fb511cfe7e5785930a586801016')
install=${_pkgname}.install
_parch=$(uname -m | sed "s/x86_64/amd64/;s/aarch64/arm64v8/")


package() {
     cd $srcdir
     install -Dm755 ${_parch}/* -t ${pkgdir}/opt/${_pkgname}
     mkdir ${pkgdir}/opt/${_pkgname}/data

     install -Dm644 *.service -t ${pkgdir}/usr/lib/systemd/system

     install -Dm644 $srcdir/rustdesk-server.sysusers  \
          ${pkgdir}/usr/lib/sysusers.d/rustdesk-server.conf
     install -Dm644 $srcdir/rustdesk-server.tmpfiles \
          ${pkgdir}/usr/lib/tmpfiles.d/rustdesk-server.conf
}
