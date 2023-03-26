# Maintainer: pysen <pysen {a|t} svartavillan {d|o|t} se>
pkgname=keptn-bin
pkgdesc="The Keptn CLI includes commands to perform various tasks to manage the Keptn installation and projects"
pkgver=1.2.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/keptn/keptn"
license=('Apache')
optdepends=(
    'kubectl'
  )
conflicts=('keptn')
provides=('keptn')
source=()
b2sums=()

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    b2sums+=('d0df968e164d9da783d6517a445d2652ba03c823303633bd6b84811a599c671900d005f97c227ceadd5825c9a083dda7bb35c7a87626615aa37ebe0513aac8be')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('8387aa082fbf2871f85896c9061968d4c612a9fcadd4c55b8366092f89b483cf6571132ba669b3a0713bcea996c81531421f338ea5dfb18e003fe03e8cb62ec4')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('cf24d02aae059a471cc4deae2ea2b22d31767ec5492d9607b516afa0517a663cf5ef18c72b4a299ce4973ad3c964b97dd01c1eb0cd94353dc66383ccd3150be7')
    ;;
esac

source+=(${pkgname/-bin/}-${pkgver}-${_pkgarch}::"https://github.com/keptn/keptn/releases/download/${pkgver}/${pkgname/-bin/}-${pkgver}-linux-${_pkgarch}.tar.gz")

package() {
  _output="${srcdir}/${pkgname/-bin/}-${pkgver}-${_pkgarch}"
  install -Dm 0755 "${pkgname/-bin/}-${pkgver}-linux-${_pkgarch}" "${pkgdir}/usr/bin/keptn"
  # Shell completions
  mkdir -p completions
  ${pkgdir}/usr/bin/keptn completion bash > completions/keptn
  ${pkgdir}/usr/bin/keptn completion zsh  > completions/_keptn
  ${pkgdir}/usr/bin/keptn completion fish > completions/keptn.fish
  install -D -m 0644 completions/keptn ${pkgdir}/usr/share/bash-completion/completions/keptn
  install -D -m 0644 completions/_keptn ${pkgdir}/usr/share/zsh/site-functions/_keptn
  install -D -m 0644 completions/keptn.fish ${pkgdir}/usr/share/fish/vendor_completions.d/keptn.fish
  # Uncomment to disable daily automatic version check (optional)
  # ${pkgdir}/usr/bin/keptn set config AutomaticVersionCheck false
}
