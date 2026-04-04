# Maintainer: Jarsey45 <hidden>
# Contributor: bash000000 <hidden>

# Certificate installed at /usr/share/adguard-cli/

pkgname=adguard-cli-bin
pkgver=1.3.35
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
sha256sums=('ac35f24c7c3ffb190c3729f9b19c7868e5bfc8a31522fc7d2d954dfaea963111')

package() {
  cd "${srcdir}/${_full_name}"
  # binaries
  install -Dp "adguard-cli" "${pkgdir}/usr/share/adguard-cli/adguard-cli"
  install -Dp "adguard_root_helper" "${pkgdir}/usr/share/adguard-cli/adguard_root_helper"
  install -Dp "certutil" "${pkgdir}/usr/share/adguard-cli/certutil"
  # signatures
  install -D -m644 "adguard-cli.sig" "${pkgdir}/usr/share/adguard-cli/adguard-cli.sig"
  install -D -m644 "adguard_root_helper.sig" "${pkgdir}/usr/share/adguard-cli/adguard_root_helper.sig"
  install -D -m644 "certutil.sig" "${pkgdir}/usr/share/adguard-cli/certutil.sig"
  # scripts and other files
  install -D "bash-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/adguard-cli.sh"
  install -D "install_cert.sh" "${pkgdir}/usr/share/adguard-cli/install-cert.sh"
  install -D "defaults.zip" "${pkgdir}/usr/share/adguard-cli/defaults.zip"
  # symlinks
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /usr/share/adguard-cli/adguard-cli "${pkgdir}/usr/bin/adguard-cli"
  ln -s /usr/share/adguard-cli/adguard_root_helper "${pkgdir}/usr/bin/adguard_root_helper"

  chmod u+s "${pkgdir}/usr/share/adguard-cli/adguard_root_helper"
}
