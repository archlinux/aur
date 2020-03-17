# Maintainer: jpkotta [at] gmail dot com
# Contributor: jpkotta [at] gmail dot com

pkgname=foldingathome-noroot
pkgver=7.5.1
pkgrel=2
pkgdesc="Folding@Home client that does not run as the root user."
arch=('x86_64')
url="http://foldingathome.org"
license=('CUSTOM')
depends=('zlib' 'bash')
optdepends=('opencl-nvidia: for folding with an nVidia GPU'
            'cuda: for folding with an nVidia GPU'
            'opencl-mesa: for folding with an older AMD GPU'
            'opencl-amd: for folding with a newer AMD GPU')
provides=('foldingathome-v7' 'foldingathome')
conflicts=('foldingathome-v7' 'foldingathome')
install=foldingathome.install

_coarse_pkgver="${pkgver:0:3}" # 7.5.1 -> 7.5
_tarball_name="fahclient_${pkgver}-64bit-release"
_url="https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${_coarse_pkgver}/${_tarball_name}.tar.bz2"
source=(foldingathome.service fah-config foldingathome.install "${_url}")
md5sums=('b508338299defffcbf7d46a02e1e763a'
         '0fd798148583d0840c664862116bd366'
         '22b156cdf21ccade658836193703b196'
         '5353688a1c5cb0a226ce8e24b8ecb771')

package() {
  cd "${srcdir}/${_tarball_name}"
  installdir="${pkgdir}/opt/fah/"

  install -D -m755 FAHClient "${installdir}"/FAHClient
  install -D -m755 FAHCoreWrapper "${installdir}"/FAHCoreWrapper
  install -D -m644 sample-config.xml "${installdir}"/sample-config.xml
  install -D -m644 copyright "${pkgdir}"/usr/share/licenses/${pkgname}/copyright
  install -D -m644 README.md "${installdir}"/README.md
  install -D -m644 CHANGELOG.md "${installdir}"/CHANGELOG.md

  cd "${srcdir}"
  install -D -m755 fah-config "${installdir}"/fah-config
  install -D -m644 foldingathome.service \
          "${pkgdir}"/usr/lib/systemd/system/foldingathome.service
}
