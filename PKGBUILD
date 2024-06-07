# Maintainer: Karol Babioch <karol@babioch.de>
# Contributor: Oleg Rakhmanov <oleg [at] archlinuxarm [dot] org>

pkgname='unixbench'
pkgver=5.1.3
pkgrel=5
pkgdesc='UnixBench is a simple benchmark whose purpose is to provide a  basic indicator of the performance of a Unix-like system.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
license=('GPL')
url="https://github.com/kdlucas/byte-unixbench"
depends=('perl')
_gitcommit='a07fcc03264915c624f0e4818993c5b4df3fa703'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdlucas/byte-unixbench/archive/${_gitcommit}.tar.gz"
    'no-make.patch'
    'ubench')

sha256sums=('0ec72c74a44f74c01244711b34d467d5112aee6044c3d3f5217842150b3ec061'
            'a1cb8aba9d0a3bbf4215f8b56efbc1aed2a0d0a592d6955275d15be49a8122e4'
            '8dda604fbb8cbec355c220965b0a014f8efcee1218d2df763aad6d4f9d8a8a21')


prepare() {
   cd "${srcdir}/byte-unixbench-${_gitcommit}/UnixBench"
   patch -Np1 -i ${srcdir}/no-make.patch
}

build() {
   cd "${srcdir}/byte-unixbench-${_gitcommit}/UnixBench"
   make
}

package() {
   cd "${srcdir}/byte-unixbench-${_gitcommit}/UnixBench"

   install -dm775 ${pkgdir}/usr/lib/unixbench
   cp -a {pgms,results,testdir,tmp,Run} ${pkgdir}/usr/lib/unixbench
   install -Dm755 ${srcdir}/ubench ${pkgdir}/usr/bin/ubench

   chmod 775 ${pkgdir}/usr/bin/ubench
   chmod 775 ${pkgdir}/usr/lib/unixbench/Run
   chmod ugoa+w ${pkgdir}/usr/lib/unixbench/{results,testdir,tmp}
}

