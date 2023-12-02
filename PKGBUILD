#Maintainer: Kimiblock

pkgname=librewolf-extension-sponsorblock-bin
url="https://github.com/ajayyy/SponsorBlock"
pkgver=5.4.29
pkgrel=1
makedepends=("jq" "curl")
pkgdesc="Skip YouTube video sponsors."
arch=('any')
license=('LGPL3')
_fileName='sponsorBlockerBETA@ajay.app.xpi'

function pkgver(){
	_rawVersion=$(curl -s https://api.github.com/repos/ajayyy/SponsorBlock/releases/latest | jq .tag_name)
	echo ${_rawVersion} | cut -c 2-$(expr ${#_rawVersion} - 1)
}

function package(){
	mkdir -p "${pkgdir}"/usr/lib/librewolf/browser/extensions
	_info "Downloading SponsorBlock ${pkgver}"
	curl "https://github.com/ajayyy/SponsorBlock/releases/download/${pkgver}/FirefoxSignedInstaller.xpi" -o "${pkgdir}/usr/lib/librewolf/browser/extensions/${_fileName}" -L
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
