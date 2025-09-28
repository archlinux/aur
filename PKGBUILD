# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Ayatale <ayatale@qq.com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgauthor=AlistGo
_pkgname=alist
pkgname=${_pkgname}-bin
pkgver=3.53.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Another file list program that supports multiple storage"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('aria2: download by aria2.')

backup=("etc/alist/config.json")

options=(!debug)

install=alist.install

source=("config.json"
        "alist.service"
        "alist.sysusers"
        "alist.tmpfiles")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}.tar.gz")
sha256sums=('b72f194a7b8855e97eeb76e63e179f38132cc9e6be9daa5b396699c9c11611de'
            '5712b21aebf669fe9fb5d47dd685809d4d9670b1bb1d5e6fef962b9d11ba9d72'
            '3658370660806f73c3d9bc5f1b6e2a013c9520d34ffc4462df99f7692473613d'
            'c6b62c4a750ab921c2e8f965e4baeee28855c9a969b00eddd346670f2fdf12de')
sha256sums_x86_64=('1e3afb5aca5f588d26036ac63ab2ab67bd9f8c7a1ef2bb342196f1539125c910')
sha256sums_aarch64=('52a9b2ee4313371f10411e7ed4b1ba9038c1896967b47983550e67285aaab10d')

package() {
    cd "${srcdir}/" || exit

    install -Dm755 alist ${pkgdir}/usr/bin/alist

    install -Dm644 config.json -t ${pkgdir}/etc/alist

    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/

    install -Dm644 alist.sysusers ${pkgdir}/usr/lib/sysusers.d/alist.conf
    install -Dm644 alist.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/alist.conf
}
