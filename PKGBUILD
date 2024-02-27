# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=oxen-core-bin
_pkgname=oxen-core
pkgver=10.4.1
pkgrel=1
pkgdesc='OXEN core for cryptocurrency based on Monero (Loki)'
url='https://github.com/oxen-io/oxen-core'
arch=('x86_64')
license=('custom')
makedepends=('wget' 'git' 'curl')
conflicts=('oxen-core' 'loki-core-git')
provides=('oxen-core')
source=("$url/releases/download/v$pkgver/oxen-linux-$arch-$pkgver.tar.xz"
        "https://raw.githubusercontent.com/oxen-io/oxen-core/dev/LICENSE")
sha256sums=('58b920a3514afcb2b04511b92942fed838017f59b43e7203e8dbc670d9bf6a41'
            '11075d9b10225bbaa5d77801888ab15aa13bef9e53a3fea442eb9f2f02ae818b')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

  # install binaries on system
  install -d "${pkgdir}/opt/${_pkgname}"
  cd ${srcdir}/oxen-linux-$arch-$pkgver
  install -m 755 oxen-blockchain-ancestry "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-export "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-mark-spent-outputs "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-usage "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-gen-trusted-multisig "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-wallet-cli "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-depth "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-import "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-blockchain-stats "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxend "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-sn-keys "${pkgdir}/opt/${_pkgname}"
  install -m 755 oxen-wallet-rpc "${pkgdir}/opt/${_pkgname}"

  # links scripts to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-ancestry "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-export "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-mark-spent-outputs "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-usage "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-gen-trusted-multisig "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-wallet-cli "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-depth "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-import "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-blockchain-stats "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxend "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-sn-keys "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/oxen-wallet-rpc "${pkgdir}/usr/bin"
}
