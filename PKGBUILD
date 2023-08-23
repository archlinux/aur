#Maintainer: Kimiblock <pn3535@icloud.com>

pkgname=librewolf-extension-violentmonkey-bin
url="https://github.com/violentmonkey/violentmonkey"
pkgver=2.15.0
pkgrel=1
makedepends=("jq" "curl")
pkgdesc="Violentmonkey provides userscripts support for browsers. It works on browsers with WebExtensions support."
arch=('any')
license=('MIT')

function pkgver(){
	_rawVersion=$(curl -s https://api.github.com/repos/violentmonkey/violentmonkey/releases/latest | jq .tag_name)
	echo ${_rawVersion} | cut -c 3-$(expr ${#_rawVersion} - 1)
}

function package(){
	mkdir -p "${pkgdir}"/usr/lib/librewolf/browser/extensions
	_info "Downloading Violentmonkey ${pkgver}"
	curl "https://github.com/violentmonkey/violentmonkey/releases/download/v${pkgver}/violentmonkey-${pkgver}.xpi" -o "${pkgdir}/usr/lib/librewolf/browser/extensions/{aecec67f-0d10-4fa7-b7c7-609a2db280cf}.xpi" -L
	chmod 0644 "${pkgdir}"/usr/lib/librewolf/browser/extensions/*
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
