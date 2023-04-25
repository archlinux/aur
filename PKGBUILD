# Maintainer: Anarcoco <archlinux.dn4qx@slmail.me>
pkgname=youtube-local-git
pkgver=2023.04.25.13098e4
pkgrel=2
pkgdesc="browser-based client for watching Youtube anonymously with greater page performance"
arch=('any')
url="https://github.com/user234683/youtube-local"
license=('AGPL3')
depends=('python-flask>=1.0.3' 'python-gevent>=1.2.2' 'brotli>=1.0.7' 'python-pysocks>=1.6.8' 'python-urllib3>=1.24.1' 'python-defusedxml>=0.5.0' 'python-cachetools>=4.0.0' 'python-stem>=1.8.0')
optdepends=('python-pytest: development requirement')
provides=(youtube-local)
replaces=(youtube-local)
_commit=13098e4c08ccb10e72dc8822c698a93a0b5a782a
source=("youtube-local-$_commit.zip"::"https://github.com/user234683/youtube-local/archive/$_commit.zip"
        youtube-local.service)
install=youtube-local.install
sha512sums=('8a19763c441b62da75bd6134b20aa2f59532f59ce13b23215cace9f44ddf2fb8970d17cf56815b1a2a563906d94d33c0d26e8089bf7821012843189d34fbfada' # This is the zip (this changes with every version)
	'9c7318b3e8fbcb3947301ff8a3060dde2d8b4c404c4aa486ac92e20264bbbefca2eba61414b7cb4905a4433c7dae8eb540cc65945980ba766c1f0c68fa9d9425')

package() {

  cd $srcdir/youtube-local-$_commit
  rm run.bat
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/youtube-local/LICENSE"
  mkdir -p ${pkgdir}/opt/youtube-local/
  cp -r * ${pkgdir}/opt/youtube-local/
    
  mkdir -p ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 ${srcdir}/youtube-local.service ${pkgdir}/usr/lib/systemd/user/
}
