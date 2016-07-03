# Maintainer: OSO <osospeed@hotmail.com>

pkgname=dry
pkgUrl=$(wget -O- https://github.com/moncho/dry/releases/ 2>&1 | grep -o -E 'href="([^"#]+)"' | cut -d'"' -f2 | egrep 'download.*linux'| sed 's|^ *[0-9]*\.||gi' | sort -rn | head -n1)
read pkgver pkgalpha pkgrel bin <<< $(echo ${pkgUrl} | sed -r 's|.*download/v([^-]+)-([^\.]+).([^/]+)/(.*)|\1 \2 \3 \4|gi');
pkgdesc="A Docker container manager for the terminal"
arch=('x86_64' 'i686')

archBin=${arch/i686/386}
archBin=${arch/x86_64/amd64}

package() {
	wget -O "dry-linux-${archBin}" "https://github.com/moncho/dry/releases/download/v${pkgver}-${pkgalpha}.${pkgrel}/dry-linux-${archBin}"
	install -Dm755 "dry-linux-${archBin}" "${pkgdir}/usr/bin/dry"
}