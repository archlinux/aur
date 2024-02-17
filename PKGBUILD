# Maintainer: huggy <arch@huggy.moe>

pkgname=authentik-outpost-bin
pkgver=2023.10.7
pkgrel=1
pkgdesc="authentik is an open-source Identity Provider that emphasizes flexibility and versatility."
arch=('x86_64' 'aarch64')
url="https://github.com/goauthentik/authentik"
license=('MIT')


if [ "$CARCH" == "x86_64" ]; then
    _arch="amd64"
    sha512sums=(
      4ac41c24448532a866311996deb815f2ee81e9dc2099a4b22396ec98a059ce03dd4b42a6448371e786932a90e60cc74797dbf96aa70d73f6713901c6c674a099
      98760442ff0389af8db19d9b20c52f564d2b31171e8106f792a4ad344d3ee2126b57259d6c5a744257c2e1b932968486b7e5ba23067c73bc42b40bd05b031198
      2f2fa87f5958219e0e85e65a97f8878673f44928b396d239f016dca2039698782496840c64cf03556d88c03c181b9f05b2111c40d2ac0dbdea3e0caf44478b02
      SKIP
      SKIP
      SKIP
      SKIP
    )
elif [ "$CARCH" == "aarch64" ]; then
    _arch="arm64"
    sha512sums=(
      9672198e86560101abe65cd195b9b79172ea46c27e3a3dca55c58901f4b4c6fe225e640eb2eb16ebd79416d15b6d71ccd367e894231ed903d7056145bce4db7f
      0ddab5e7b3a518c3c821bdaf0513122fe88f2c43cf486687a8474f38e8cf64cf5726ac65491dd572c67750a8e41ad8545b8d08911ea00c4bbd6d2cd87f21620f
      c090da86d7393bcedfdda2c35f532a7432697298fcb190a7c5d81c74c1f60a81e318782d82723af45fcc85d61a3f7dada208bfa3b06400d46c2091337d7524dc
      SKIP
      SKIP
      SKIP
      SKIP
    )
else
    echo "Unsupported architecture: $CARCH"
    exit 1
fi

source=(
  https://github.com/goauthentik/authentik/releases/download/version%2F${pkgver}/authentik-outpost-ldap_linux_${_arch}
  https://github.com/goauthentik/authentik/releases/download/version%2F${pkgver}/authentik-outpost-proxy_linux_${_arch}
  https://github.com/goauthentik/authentik/releases/download/version%2F${pkgver}/authentik-outpost-radius_linux_${_arch}
  authentik-outpost-ldap.service
  authentik-outpost-proxy.service
  authentik-outpost-radius.service
  authentik-outpost.env
)


package() {
  install -Dm755 authentik-outpost-ldap_linux_${_arch} "${pkgdir}/usr/bin/authentik-outpost-ldap"
  install -Dm755 authentik-outpost-proxy_linux_${_arch} "${pkgdir}/usr/bin/authentik-outpost-proxy"
  install -Dm755 authentik-outpost-radius_linux_${_arch} "${pkgdir}/usr/bin/authentik-outpost-radius"

  install -Dm644 *.service -t "${pkgdir}"/usr/lib/systemd/system
  
  install -Dm644 authentik-outpost.env "${pkgdir}"/etc/authentik-outpost-ldap.env
  install -Dm644 authentik-outpost.env "${pkgdir}"/etc/authentik-outpost-proxy.env
  install -Dm644 authentik-outpost.env "${pkgdir}"/etc/authentik-outpost-radius.env
}
