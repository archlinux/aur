# Contributor: charlesneimog <charlesneimog@outlook.com>
# Contributor: Asuka Minato
# Contributor: elementh <hello@lucasmarino.me>
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
pkgver=0.35.27
pkgrel=1
pkgdesc="Operating environment for the new internet. Anytype is a next generation software that breaks down barriers between applications, gives back privacy and data ownership to users."
arch=('x86_64')
url="https://anytype.io/"
license=('custom')
depends=('electron' bash glibc gcc-libs libsecret glib2 hicolor-icon-theme)
optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype'
           'anytype-legacy')
source=(
    "https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}-beta/anytype_${pkgver}-beta_amd64.deb"
    )
sha256sums=('40535d983bf8e037eb22eb91f29a6433ccc5ddc3504715486bca975eb117b167')

package() {
  	tar -xvf data.tar.* -C $pkgdir
  	find $pkgdir/opt -type f -not -path "*/resources/*" -print -delete
  	printf '#!/bin/sh
	exec env ELECTRON_IS_DEV=0 electron /opt/Anytype/resources/app.asar "$@"
	' | install -Dm755 /dev/stdin $pkgdir/opt/Anytype/anytype
	install -Dm644 "${pkgdir}/usr/share/icons/hicolor/0x0/apps/anytype.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/anytype.png"

}
