# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>
# Contributor: FabioLolix

pkgname=exoscale-cli-bin
pkgver=1.87.0
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="https://github.com/exoscale/cli"
license=('Apache')

validpgpkeys=('7100E8BFD6199CE0374CB7F003686F8CDE378D41')
provides=('exoscale-cli')
conflicts=('exoscale-cli')

source=("https://github.com/exoscale/cli/releases/download/v${pkgver}/exoscale-cli_${pkgver}_linux_amd64.tar.gz"
        "https://github.com/exoscale/cli/releases/download/v${pkgver}/exoscale-cli_${pkgver}_linux_amd64.tar.gz.sig")
sha256sums=('7034ed3e14306df55b90053ac9ca83e1479abebca0155593814d08fa42b79ed5'
            'SKIP')

if [ $SKIPPGPCHECK = 0 ] && ! gpg --list-keys 7100E8BFD6199CE0374CB7F003686F8CDE378D41 >/dev/null 2>&1; then
  warning "This package is signed with a GPG key that is not on your system."
  warning "To install this package, you either need to import the key:"
  warning ""
  warning "    gpg --keyserver keys.openpgp.org --recv-key 7100E8BFD6199CE0374CB7F003686F8CDE378D41"
  warning ""
  warning "Or you may install the package without checking the signature:"
  warning ""
  warning "    makepkg --skippgpcheck"
fi

package() {
  install -Dm755 "${srcdir}/exo" "${pkgdir}/usr/bin/exo"
  install -d 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm 644 "${srcdir}/contrib/completion/bash/exo" "${pkgdir}/usr/share/bash-completion/completions/exo"
  install -d 755 "${pkgdir}/usr/share/man/man1"
  install -Dm 644 "${srcdir}/manpage/"* -t "${pkgdir}/usr/share/man/man1"
}
