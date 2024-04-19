# Maintainer: huggy <arch@huggy.moe>

pkgname=authentik-outpost-bin
pkgver=2024.2.3
pkgrel=1
pkgdesc="authentik is an open-source Identity Provider that emphasizes flexibility and versatility."
arch=('x86_64' 'aarch64')
url="https://github.com/goauthentik/authentik"
license=('MIT')


if [ "$CARCH" == "x86_64" ]; then
    _arch="amd64"
    sha512sums=(
      9abb7f7922ea8b76446f6a747c75da3f15d57e2324c01c6f4b965ba693238d51071185bf56e5262bd98fb18a6f816f666c97bde6061a5beafde56d233edfd187
      be1e4a51ae060d9fab9d43dcf7e61d763a510080b495a88d533c5ba1a354d4e34dcef4b2bafdbda020dd556f71d4d1688285a97ce8a8272897a175112a65df8d
      8a01f20e6a6ef7f6c70926029cfe3e917d05db7cf0506f598eb5fcf3355b6aa8eabf5b6dcff3cbbfb13417b94d9150663c2ca35bc88df8c70ffbedc9217426b9
      SKIP
      SKIP
      SKIP
      SKIP
    )
elif [ "$CARCH" == "aarch64" ]; then
    _arch="arm64"
    sha512sums=(
      489a5f6263ea61b9a5a2b32385b60a758d8f601ce319721b9a1a61b9e5962c39239d2da4eb107409f928ad324adb4ef52deeb19861d4b022572286fead5dd361
      e2cbfe3c64d2907948dcaceb41ba986fa252bf0440ec769617133703387ac4619cd74a8199afa684571a4d6edd18bc8b406dce61b2e151463715aa544994f789
      4da3df2e0594a4af668fc1ebd91c67a7bfc77c5082b83d3fe6a8e9701c79dd26dd26a68930692d856a2ea55254417c961f328937b66cb2ad3378dae3938cfb89
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
