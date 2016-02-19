# AUR maintainer: Swyter <swyterzone+aur@gmail.com>
# Original Linux porter: cfcohen <https://github.com/cfcohen>

# For more info and discussion about the Linux version go here:
# https://forums.taleworlds.com/index.php/topic,313683.0.html

pkgname=gnome-dds-thumbnailer
pkgdesc='View DirectDraw Surface textures in Nautilus and Nemo.'
pkgver=2016.02.19
pkgrel=1
arch=('any')
url=https://en.wikipedia.org/wiki/DirectDraw_Surface
license=('GPL')
depends=('imagemagick')
source=()
md5sums=()

build()
{
	cat <<EOF > "${srcdir}/dds.thumbnailer"
# created by swyter <swyterzone@gmail.com>, requires imagemagick
[Thumbnailer Entry]
TryExec=convert

# -> comment out the second version to use the provided thumbnail
# -> size, instead of hardcoding them to 32px, which is faster.
Exec=convert -thumbnail 32 %i png:%o
#Exec=convert -thumbnail %s %i png:%o

# -> this is just for testing
#Exec=sh -c 'echo "%s %i %o" >> /tmp/thumbs.txt'

MimeType=image/x-dds

EOF
}

package()
{
	install -D -m644    "${srcdir}/dds.thumbnailer" "${pkgdir}/usr/share/thumbnailers/dds.thumbnailer"
}
