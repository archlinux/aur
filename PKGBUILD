# Maintainer: huggy <arch@huggy.moe>

pkgname=authentik-outpost-bin
pkgver=2024.2.1
pkgrel=1
pkgdesc="authentik is an open-source Identity Provider that emphasizes flexibility and versatility."
arch=('x86_64' 'aarch64')
url="https://github.com/goauthentik/authentik"
license=('MIT')


if [ "$CARCH" == "x86_64" ]; then
    _arch="amd64"
    sha512sums=(
      af0e7fa32b61b723d97b93502f837c0f7e8bb4f691a2c4d0fd6089dfa7e08c2105078d109542d86526becaf89a296e9d653420b7b78c265849149cc52613703a
      4facd5ad722339a270204a8ded40de035af147c4e2ac3313dec7a05158b1e4b003fcc7a30383917ea02abfaefcedb678e4fd6eaaa46eb8850d73373c72ddd30c
      8d8fea9eed245ef9c21d9103a395bbcb88aebe72aad8aec398ebafa086a0dc115758c822efdc3599a7828c09eca1391bb37f5cd7ab88c9005031841b0e20eab3
      SKIP
      SKIP
      SKIP
      SKIP
    )
elif [ "$CARCH" == "aarch64" ]; then
    _arch="arm64"
    sha512sums=(
      0c7baf5f2758853060ad401c6ee61bc885a344a5fe91b99f98c397a62cfc0830561cc4c0aea5233b67f05d8a07a741f8824958108ff265ab984e4f30bcbbb857
      6b203987fc9c75356d9987027ac10614dcfa2445a519bf7932dfe7ab8ee9f90797d329c0e5c3390e2bd0204170fe12a130a9e6f553fb8bef07409e0cfa72e2ca
      85ec4ebea124514265aea9a7a37dfd53e490f2d3832b9ba3389b460cf46fcdae4a8b5bd9a2a2d82d0b37cb6d164c8caf1e042e346753101ec221514ba2ea4637
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
  https://github.com/goauthentik/authentik/releases/download/version/${pkgver}/authentik-outpost-ldap_linux_${_arch}
  https://github.com/goauthentik/authentik/releases/download/version/${pkgver}/authentik-outpost-proxy_linux_${_arch}
  https://github.com/goauthentik/authentik/releases/download/version/${pkgver}/authentik-outpost-radius_linux_${_arch}
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
