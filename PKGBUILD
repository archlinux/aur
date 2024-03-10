# Contributor: charlesneimog <charlesneimog@outlook.com>
# Contributor: Asuka Minato
# Contributor: elementh <hello@lucasmarino.me>
# Contributor: Ash Price <eisleggje@gmail.com>
# Contributor: Adrian Perez <aperez@igalia.com>
#
# WARNING WARNING WARNING WARNING WARNING    
# IMPORTANT: MIGRATION
#                                            
# If you are coming from the > 0.3.2 BETA please read the instructions:
# 
# 1. Install `anytype-legacy`
# 2. Follow the instructions HERE: https://community.anytype.io/t/anytype-legacy-to-beta-migration-trail-guide/9274 
#    UP to the point 2., BUT NOT 3.
# 3. Now install `anytype-bin` (this package) and now you can follow point 3. and login with the recovery phrase.
# 
# Thanks.
#                                            
pkgname=anytype-electron-bin
pkgver=0.38.36
pkgrel=1
pkgdesc="Operating environment for the new internet. Anytype is a next generation software that breaks down barriers between applications, gives back privacy and data ownership to users."
arch=('x86_64')
url="https://anytype.io/"
license=('custom')
depends=('electron27' bash glibc gcc-libs libsecret glib2 hicolor-icon-theme)
optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype'
           'anytype-legacy')
source=(
	"https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}-beta/anytype_${pkgver}-beta_amd64.deb"
    )
sha256sums=('29cd19fbcdb89998fcc20189f4ee87fdc114741ef849f70ebd646a39284adcf0')

package() {
  	tar -xvf data.tar.* -C $pkgdir
  	find $pkgdir/opt -type f -not -path "*/resources/*" -print -delete
  	printf '#!/bin/sh
	exec env ELECTRON_IS_DEV=0 electron27 /opt/Anytype/resources/app.asar "$@"
	' | install -Dm755 /dev/stdin $pkgdir/opt/Anytype/anytype

}
