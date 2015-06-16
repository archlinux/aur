# Contributor: vantu5z <vantu5z@mail.ru>
pkgname=rhvoice-dictionary-git
pkgver=20150616
pkgrel=1
pkgdesc="Русский словарь для RHVoice"
arch=('i686' 'x86_64')
url="https://github.com/vantu5z/RHVoice-dictionary"
license=('GPL3')
depends=('rhvoice')
provides=('rhvoice-dictionary')
replaces=('rhvoice-dictionary')

_gitroot='https://github.com/vantu5z/RHVoice-dictionary.git'
_gitname='RHVoice-dictionary'

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."
}

package()
{
    cd "$srcdir/$_gitname"
    mkdir -p ${pkgdir}/etc/RHVoice/dicts/Russian/
    cp -R user_dict.txt "$pkgdir/etc/RHVoice/dicts/Russian/"
}
