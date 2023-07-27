#Maintainer: Kimiblock <pn3535@icloud.com>

pkgname=librewolf-extension-ublock-origin-bin
url="https://github.com/gorhill/uBlock"
pkgver=1.51.0
pkgrel=1
makedepends=("jq" "curl")
pkgdesc="uBlock Origin - An efficient blocker. Fast and lean."
arch=('any')
license=('LGPL3')
_fileName='uBlock0@raymondhill.net.xpi'
provides=('librewolf-ublock-origin' 'librewolf-extension-ublock-origin')
conflicts=('librewolf-ublock-origin')

function pkgver(){
	_rawVersion=$(curl -s https://api.github.com/repos/gorhill/uBlock/releases/latest | jq .tag_name)
	echo ${_rawVersion} | cut -c 2-$(expr ${#_rawVersion} - 1)
}

function package(){
	mkdir -p "${pkgdir}"/usr/lib/librewolf/browser/extensions
	_info "Downloading uBlock Origin ${pkgver}"
	curl "https://github.com/gorhill/uBlock/releases/download/${pkgver}/uBlock0_${pkgver}.firefox.signed.xpi" -o "${pkgdir}/usr/lib/librewolf/browser/extensions/${_fileName}" -L
	chmod 0644 "${pkgdir}/usr/lib/librewolf/browser/extensions/${_fileName}"
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
