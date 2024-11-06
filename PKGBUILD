# AUR maintainer and creator: Swyter <swyterzone+aur@gmail.com>
# GNOME thumbnailer info and sundry references down here:

# https://tecnocode.co.uk/2013/10/21/writing-a-gnome-thumbnailer/
# https://github.com/hadess/gnome-thumbnailer-skeleton
# https://imagemagick.org/script/convert.php
# https://stackoverflow.com/questions/16689557/convert-pdf-to-png-without-output-file-extension-using-imagemagick/16689602#16689602

pkgname=gnome-dds-thumbnailer
pkgdesc='View DirectDraw Surface textures in Nautilus and Nemo.'
pkgver=2016.02.19
pkgrel=2
arch=('any')
url=https://en.wikipedia.org/wiki/DirectDraw_Surface
license=('GPL')
depends=('imagemagick')
conflicts=('tumbler-extra-thumbnailers')
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
