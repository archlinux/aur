# Maintainer: Saurabh Kumar Sharma <saurabh000345 at gmail dot com>
pkgname=lolminer
pkgver=1.0
pkgrel=5
pkgdesc="Unofficial installer for lolMiner: https://github.com/Lolliedieb/lolMiner-releases"
arch=("x86_64")
url="https://github.com/Lolliedieb/lolMiner-releases"
license=("GPL")
depends=("curl" "tar" ) 
options=('!strip')

prepare(){
    # Getting latest package version
    latver=$(curl --silent 'https://api.github.com/repos/Lolliedieb/lolMiner-releases/releases/latest' | grep ".*tag_name.*" | sed -E 's/.*"([^"]+)".*/\1/')
    mkdir -p lolminer 
    downloadlink=$(curl --silent 'https://api.github.com/repos/Lolliedieb/lolMiner-releases/releases/latest' | grep ".*browser_download_url.*Lin64.*" | sed -E 's/.*"([^"]+)".*/\1/')
    echo "Downloading lolMiner v$latver"
    echo "    using link: $downloadlink" 
    curl -L "$downloadlink" | tar xzf - --directory "lolminer" --strip-components=1
}

package(){
    install -dm755 "${pkgdir}/"{opt,usr/bin/}
    cp -rL "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/lolMiner" "${pkgdir}/usr/bin/lolminer"
}
