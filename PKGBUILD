# Maintainer/Originator: Jake VanderKolk <jakevanderkolk@gmail.com>
pkgname=hostsblock
pkgver=0.999.4
pkgrel=2
pkgdesc="A script that downloads, sorts, and compiles multiple ad- and malware-blocking hosts files."
arch=(any)
url="http://gaenserich.github.com/hostsblock/"
license=('GPL')
depends=(bash curl grep sed coreutils gzip)
optdepends=('dnsmasq: helps speed up DNS resolutions'
	    'pixelserv: removes boilerplate page on blocked urls'
	    'kwakd: removes boilerplate page on blocked urls (recommended)'
	    'unzip: allows the use of zipped downloads'
	    'p7zip: allows the use of 7zipped downloads'
            'pigz: improves performance of gzip operations')
backup=('var/lib/hostsblock/hostsblock.conf' 'var/lib/hostsblock/black.list' 'var/lib/hostsblock/white.list' 'var/lib/hostsblock/hosts.head')
changelog=$pkgname.changelog
install=$pkgname.install
source=('hostsblock.sh' 'hostsblock.conf' 'black.list' 'white.list' 'hosts.head' 'hostsblock.service' 'hostsblock.timer')
sha1sums=('344d904a3710e980d8a7770db210e8f3af7c409c'
          'd9db54fb078ff0e674a1f32a886ad29969830459'
          '30fdaad1ee0497b9b88b61cfbd958d20c644801b'
          '11ab0a6bac002879a04872ec06a3611c32c80e1d'
          'cff64336645b54e11248d31a6e4406cc3642483f'
          '7196c143f060f4dcfc12d2d1ca36a5055ac51ef2'
          'f57b1cd082e29631b6fbaae5a7191dbc3ddf176b')

package() {
  install -Dm750 "$srcdir"/hostsblock.sh "$pkgdir"/usr/bin/hostsblock
  ln -sf /usr/bin/hostsblock "$pkgdir"/usr/bin/hostsblock-urlcheck
  install -Dm640 "$srcdir"/hostsblock.conf "$pkgdir"/var/lib/hostsblock/hostsblock.conf
  install -Dm640 "$srcdir"/black.list "$pkgdir"/var/lib/hostsblock/black.list
  install -Dm640 "$srcdir"/white.list "$pkgdir"/var/lib/hostsblock/white.list
  install -Dm640 "$srcdir"/hosts.head "$pkgdir"/var/lib/hostsblock/hosts.head
  install -Dm640 "$srcdir"/hostsblock.service "$pkgdir"/usr/lib/systemd/system/hostsblock.service
  install -Dm640 "$srcdir"/hostsblock.timer "$pkgdir"/usr/lib/systemd/system/hostsblock.timer
}
