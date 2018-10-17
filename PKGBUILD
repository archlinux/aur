# Maintainer: Marochkin Sergey <me@ziggi.org>
# Contributor: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname='yandex-disk'
pkgver=0.1.5.1010
pkgrel=1
pkgdesc='Yandex.Disk keeps your files with you at all times.'
arch=('i686' 'x86_64')
url='http://disk.yandex.ru/'
license=('custom')
depends=('glibc' 'gcc' 'gcc-libs' 'zlib')
_arch='i386'
[ "$CARCH" = "x86_64" ] && _arch='amd64'
install=yandex-disk.install
source=("http://repo.yandex.ru/yandex-disk/deb/pool/main/y/yandex-disk/yandex-disk_${pkgver}_${_arch}.deb"
        "yandex-disk.install"
        "yandex-disk.service")

sha512sums=('9975239552916579242a8ee8f4f76a1359729cb34686e5bc85a81e5730a8415f99e72a159cf86c7bda4f3466962afcda5d3aeb2a22d7d200b97bed009e610350'
            '847a1c619c9c0ddf1f8c6bbc9723cff3d91cc2509bc4b2b5642103eab43bc413a52737b88d70fc33167a46d253228dbb510208ee48152561c903827de8b93ae7'
            '59dab055056c8c9718599903775078a1fe5f518baec6b2e3ce16eaedf700ecb14a65e5a265ff7256fd1bfc583254773edf8ae3c0781958ff81d17e89004717e9')

[ "$CARCH" = "x86_64" ] &&
sha512sums=('87eefa335372c10013d6237a0ffc694c01b9407f19a0a3608874abeec0f4f05b9ebcb738ddd01fa9cae0a04df843f0b9eb99934e00a6d36d27fef3774dcda72d'
            '847a1c619c9c0ddf1f8c6bbc9723cff3d91cc2509bc4b2b5642103eab43bc413a52737b88d70fc33167a46d253228dbb510208ee48152561c903827de8b93ae7'
            '59dab055056c8c9718599903775078a1fe5f518baec6b2e3ce16eaedf700ecb14a65e5a265ff7256fd1bfc583254773edf8ae3c0781958ff81d17e89004717e9')

package() {
        cd $srcdir

        ar x *.deb
        bsdtar xf data.tar.gz -C $pkgdir

        install -Dm644 "${srcdir}/yandex-disk.service" "${pkgdir}/usr/lib/systemd/user/yandex-disk.service"
}
