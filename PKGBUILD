# Maintainer: depsterr <depsterr at protonmail dot com>
pkgname=glasscord-git
pkgver=0.0.7.1
pkgrel=1
epoch=
pkgdesc='Providing composition effects to the Discord client.'
arch=('any')
url='https://github.com/AryToNeX/Glasscord'
license=('Apache License 2.0')
groups=()
depends=('discord')
makedepends=('git' 'npm')
checkdepends=()
optdepends=()  
provides=()    
conflicts=() 
replaces=()
backup=()   
options=() 
install=
changelog=  
source=("Glasscord::git+git://github.com/AryToNeX/Glasscord.git")
noextract=()
md5sums=(SKIP)                                              
validpgpkeys=()

pkgver() {
	cd $srcdir/Glasscord
	printf "%s" "$(awk '/version/ { gsub("\"",""); gsub(",",""); print $2 }' package.json)"
}

build() {
	cd "$srcdir/Glasscord"
	npm install
}

package() {
	injdir=`find ~/.config/discord -name "discord_desktop_core" -type d`
	
	cp "$srcdir/Glasscord/glasscord.asar" "$injdir"

	[ -z $(grep "require('./glasscord.asar')" "$injdir/index.js") ] &&\
		echo "require('./glasscord.asar')" | cat - "$injdir/index.js" > "$srcdir/index.js" &&\
		cp "$srcdir/index.js" "$injdir"
}

