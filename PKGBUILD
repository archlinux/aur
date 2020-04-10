#Maintainer: Sudhip Nashi <sudhip@nashi.us>
pkgbase='reddit-fs'
pkgname='redditfs'
pkgver=1.1
pkgrel=1
pkgdesc="maps subreddits to a FUSE filesystem, and comes with a systemd service"
arch=('any')
url="https://github.com/Petraea/redditfs"
license=('MIT')
depends=('python3' 'python-virtualenv')
source=('redditfs' 'redditfs.service')
sha512sums=('4f513937b449185af11e3fd3f338a7b3cf5c83e06beda9ffefcf096fa65967b623507d13fcdfd87de404dacbc1080420bfe119ae0a1ecaab1e73254790ff3b23' '3eeddb01ddbbe1a47e8ad0af4ac3a49d7ae6084a4f3ed9f4953b2db3feb063ec943bc46c5cf4b45faa8affa6dede4f5e7b9ecbc2f678f2f85831ba7d361232d1')

package() {
    mkdir -p "$pkgdir"/usr/lib/systemd/system
    mkdir -p "$pkgdir"/usr/bin
    git clone https://github.com/Petraea/redditfs.git "$pkgdir"/opt/.redditfsdata
    mkdir "$pkgdir"/opt/r
    cp "$pkgname" "$pkgdir"/usr/bin
    cp redditfs.service "$pkgdir"/usr/lib/systemd/system/
    sed -i "/Restart=always/ a User=$USER \nGroup=$USER" "$pkgdir"/usr/lib/systemd/system/redditfs.service
}

