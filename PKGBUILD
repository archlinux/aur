# Maintainer: Jarsey45 <hidden>
# Contributor: bash000000 <hidden>

# Certificate installed at /usr/share/adguard-cli/

pkgname=adguard-cli-bin
pkgver=1.4.13
_pkgstatus=release
pkgrel=1
pkgdesc='Surf the Web ad-free and safely. Shields up'
arch=('x86_64')
url='https://github.com/AdguardTeam/AdGuardCLI'
options=('!strip')
install='adguard-cli.install'
conflicts=('adguard-cli-nightly-bin')

_full_name="adguard-cli-${pkgver}-linux-${arch}"

source=(
  "https://github.com/AdguardTeam/AdGuardCLI/releases/download/v${pkgver}-${_pkgstatus}/${_full_name}.tar.gz"
)
sha256sums=('0575c9a2397fc1537d9c8213811f0d79867a7953f2481f3e9677bd3f0a2cf88c')

package() {
  cd "${srcdir}/${_full_name}"
  # binaries
  install -Dp "adguard-cli" "${pkgdir}/usr/share/adguard-cli/adguard-cli"
  install -Dp "adguard_root_helper" "${pkgdir}/usr/share/adguard-cli/adguard_root_helper"
  install -Dp "certutil" "${pkgdir}/usr/share/adguard-cli/certutil"
  install -Dp "adguard_cli_nm" "${pkgdir}/usr/share/adguard-cli/adguard_cli_nm"
  # signatures
  install -D -m644 "adguard-cli.sig" "${pkgdir}/usr/share/adguard-cli/adguard-cli.sig"
  install -D -m644 "adguard_root_helper.sig" "${pkgdir}/usr/share/adguard-cli/adguard_root_helper.sig"
  install -D -m644 "certutil.sig" "${pkgdir}/usr/share/adguard-cli/certutil.sig"
  install -D -m644 "adguard_cli_nm.sig" "${pkgdir}/usr/share/adguard-cli/adguard_cli_nm.sig"
  # scripts and other files
  install -D "bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/adguard-cli.sh"
  install -D "install_cert.sh" "${pkgdir}/usr/share/adguard-cli/install-cert.sh"
  install -D "defaults.zip" "${pkgdir}/usr/share/adguard-cli/defaults.zip"
  # symlinks
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /usr/share/adguard-cli/adguard-cli "${pkgdir}/usr/bin/adguard-cli"
  ln -s /usr/share/adguard-cli/adguard_root_helper "${pkgdir}/usr/bin/adguard_root_helper"
  ln -s /usr/share/adguard-cli/adguard_cli_nm "${pkgdir}/usr/bin/adguard_cli_nm"

  chmod u+s "${pkgdir}/usr/share/adguard-cli/adguard_root_helper"
}
