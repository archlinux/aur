# Maintainer: rawkode <rawkode@pm.me>
# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

_pkgname=pulumi
pkgname=pulumi-bin
pkgver=2.21.0
pkgrel=1
pkgdesc="Modern Infrastructure as Code"
arch=('x86_64')
license=('Apache-2.0')
url="https://github.com/pulumi/pulumi"
source=("https://get.pulumi.com/releases/sdk/${_pkgname}-v${pkgver}-linux-${CARCH/x86_64/x64}.tar.gz")
sha256sums=('cda4e7274fe0afb3d966a68ec13e894737ddfb9b703461ad0ec79f94519b3aa4')
package() {
  cd "${srcdir}/${_pkgname}"

  for f in \
    "$_pkgname" \
    "${_pkgname}-analyzer-policy" \
    "${_pkgname}-analyzer-policy-python" \
    "${_pkgname}-language-dotnet" \
    "${_pkgname}-language-go" \
    "${_pkgname}-language-nodejs" \
    "${_pkgname}-language-python" \
    "${_pkgname}-language-python-exec" \
    "${_pkgname}-resource-pulumi-nodejs" \
    "${_pkgname}-resource-pulumi-python" \
  ; do
    install -D -m 755 "$f" "${pkgdir}/usr/bin/${f}"
  done

  # Generate Bash completion
  mkdir -p "${pkgdir}/etc/bash_completion.d"
  "${pkgdir}/usr/bin/${_pkgname}" gen-completion bash |\
    install -m644 /dev/stdin "${pkgdir}/etc/bash_completion.d/${_pkgname}"

  # Generate ZSH completion
  mkdir -p "${pkgdir}/usr/local/share/zsh/site-functions"
  "${pkgdir}/usr/bin/${_pkgname}" gen-completion zsh |\
    install -m644 /dev/stdin "${pkgdir}/usr/local/share/zsh/site-functions/_${_pkgname}"
}
