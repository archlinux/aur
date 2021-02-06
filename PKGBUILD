# Maintainer: Saurabh Kumar Sharma <saurabh000345 at gmail dot com>
pkgname=lolminer
pkgver=1.0
pkgrel=2
pkgdesc="Unofficial installer for lolMiner: https://github.com/Lolliedieb/lolMiner-releases"
arch=("x86_64")
url="https://github.com/Lolliedieb/lolMiner-releases"
lisense=("GPL")
depends=("curl" "tar" ) 
options=('!strip')

prepare(){
    # Getting latest package version
    latver=$(curl --silent 'https://api.github.com/repos/Lolliedieb/lolMiner-releases/releases/latest' | grep ".*tag_name.*" | sed -E 's/.*"([^"]+)".*/\1/')
    echo "Downloading lolMiner v$latver"
    mkdir -p lolminer 
    curl -L "https://github.com/Lolliedieb/lolMiner-releases/releases/download/$latver/lolMiner_v${latver}_Lin64.tar.gz" | tar xzf - --directory "lolminer" --strip-components=1
}

package(){
    install -dm755 "${pkgdir}/"{opt,usr/bin/}
    cp -rL "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
    ln -s "${pkgdir}/opt/${pkgname}/lolMiner" "${pkgdir}/usr/bin/lolminer"
}
