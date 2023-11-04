#Maintainer: Kimiblock

pkgname=(librewolf-extension-ubolite-bin firefox-extension-ubolite-bin)
url="https://github.com/uBlockOrigin/uBOL-home"
pkgver=2023.11.4.95
pkgrel=1
makedepends=("jq" "curl")
pkgdesc="uBO Lite (uBOL), a permission-less MV3 API-based content blocker."
arch=('any')
license=('GPL3')

function pkgver(){
	_rawVersion=$(curl -s https://api.github.com/repos/uBlockOrigin/uBOL-home/releases/latest | jq .tag_name)
	echo ${_rawVersion} | cut -c 10-$(expr ${#_rawVersion} - 1)
}

function package_librewolf-extension-ubolite-bin(){
	mkdir -p "${pkgdir}"/usr/lib/librewolf/browser/extensions
	_info "Downloading uBO Lite ${pkgver}"
	curl https://github.com/uBlockOrigin/uBOL-home/releases/download/uBOLite_${pkgver}/uBOLite_${pkgver}.firefox.signed.mv3.xpi -o "${pkgdir}/usr/lib/librewolf/browser/extensions/uBOLite@raymondhill.net.xpi" -L
	chmod 0644 "${pkgdir}"/usr/lib/librewolf/browser/extensions/*
}

function package_firefox-extension-ubolite-bin(){
	mkdir -p "${pkgdir}"/usr/lib/firefox/browser/extensions
	_info "Downloading uBO Lite ${pkgver}"
	curl https://github.com/uBlockOrigin/uBOL-home/releases/download/uBOLite_${pkgver}/uBOLite_${pkgver}.firefox.signed.mv3.xpi -o "${pkgdir}/usr/lib/firefox/browser/extensions/uBOLite@raymondhill.net.xpi" -L
	chmod 0644 "${pkgdir}"/usr/lib/firefox/browser/extensions/*
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
