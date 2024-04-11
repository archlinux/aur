# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=liquidprompt
pkgver=2.2.0_rc.2
pkgrel=1
pkgdesc="A useful adaptive prompt for Bash & Zsh"
arch=("any")
url="https://github.com/nojhan/liquidprompt"
license=("AGPL3")
conflicts=("liquidprompt-git")
depends=("ncurses"
	     "grep"
	     "gawk"
	     "sed"
	     "procps-ng"
	     "inetutils"
	     "coreutils")
optdepends=("acpi: Battery and temperature status"
	        "lm_sensors: Temperature status"
            "screen: Show detached GNU Screen session status"
            "tmux: Show detached tmux session status"
            "git: Show Git repository status"
            "mercurial: Show Mercurial repository status"
            "subversion: Show Subversion repository status"
            "breezy: Show Bazaar repository status"
            "fossil: Show Fossil repository status"
            "kubectl: Show Kubernetes context"
            "aws-cli: Show Amazon Web Services profile"
            "docker: Show Docker status"
            "podman: Show Podman status"
            "lxc: Show LXC status"
            "nodeenv: Show nodeenv virtual environment status"
            "nvm: Show NVM virtual environment status"
            "terraform: Show Terraform workspace status"
            "python-virtualenv: Show Python virtual environment status")
source=("https://github.com/nojhan/liquidprompt/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('1f4829d21ba07286808b38ea6b80809ff7c93a6502df1d74db4969ce3ada0939')

build () {
  cd "${pkgname}-${pkgver//_/-}"
  ./tools/config-from-doc.sh > liquidpromptrc-dist
}

package() {
  cd "${pkgname}-${pkgver//_/-}"
  install -Dm755 liquidprompt "${pkgdir}/usr/bin/liquidprompt"
  install -Dm644 liquidpromptrc-dist "${pkgdir}/etc/liquidpromptrc"
  install -dm755 "${pkgdir}/usr/share/liquidprompt/themes"
  for theme in themes/*; do
    theme_name=$(basename "$theme")
    cp -R "$theme" "${pkgdir}/usr/share/liquidprompt/themes/$theme_name"
  done
}

# vim: set ts=8 sw=8 tw=0 noet :
