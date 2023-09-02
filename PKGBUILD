# Maintainer: Kimiblock

pkgname=librewolf-extension-ublock-origin-bin
url="https://github.com/gorhill/uBlock"
pkgver=uBOLite_1.0.23.8155
pkgrel=1
makedepends=("jq" "curl")
pkgdesc="uBlock Origin - An efficient blocker. Fast and lean."
arch=('any')
license=('LGPL3')
_fileName='uBlock0@raymondhill.net.xpi'
depends=("firefox-ublock-origin")
provides=('librewolf-ublock-origin' 'librewolf-extension-ublock-origin')
conflicts=('librewolf-ublock-origin')

function pkgver(){
	_rawVersion=$(curl -s https://api.github.com/repos/gorhill/uBlock/releases/latest | jq .tag_name)
	echo ${_rawVersion} | cut -c 2-$(expr ${#_rawVersion} - 1)
}

function package(){
	mkdir -p "${pkgdir}"/usr/lib/librewolf/browser/extensions
	ln -s /usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi "${pkgdir}/usr/lib/librewolf/browser/extensions"
}

function _info() {
	if [ -f /usr/bin/pamac ]; then
		echo "  ==> [Info]: $@"
	else
		all_off="$(tput sgr0)"
		bold="${all_off}$(tput bold)"
		blue="${bold}$(tput setaf 4)"
		yellow="${bold}$(tput setaf 3)"
		printf "${blue}==>${yellow} [Info]:${bold} $1${all_off}\n"
	fi
}
