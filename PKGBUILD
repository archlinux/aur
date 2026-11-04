# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
# Contributor: Marochkin Sergey <me@ziggi.org>
# Contributor: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname='yandex-disk'
pkgver=0.1.6.1081
pkgrel=1
pkgdesc='Yandex.Disk keeps your files with you at all times.'
arch=('x86_64')
url='http://disk.yandex.ru/'
license=('LicenseRef-yandex-disk')
depends=('glibc' 'gcc' 'gcc-libs' 'zlib')
_deb_package="yandex-disk_${pkgver}_amd64.deb"
install=yandex-disk.install
source=("$_deb_package::https://repo.yandex.ru/yandex-disk/deb/pool/main/y/yandex-disk/$_deb_package"
        "yandex-disk.install"
        "yandex-disk.service")
md5sums=('36cd5e191a0c3e36a90fff5e9de02bc6'
        '5ad775bd895526c6b1f335c6d71dbdfa'
        '3d0370f3dfadf9da294b91441c226547')

package() {
    cd "$srcdir"
    ar x "$_deb_package"
    bsdtar xf data.tar.gz -C "$pkgdir"
    install -Dm644 "$pkgdir/usr/share/doc/yandex-disk/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${srcdir}/yandex-disk.service" "${pkgdir}/usr/lib/systemd/user/yandex-disk.service"
}
