# Maintainer: Anarcoco <archlinux.dn4qx@slmail.me>
pkgname=youtube-local-git
pkgver=2022.08.04.0e5ffd5
pkgrel=1
pkgdesc="browser-based client for watching Youtube anonymously with greater page performance"
arch=('any')
url="https://github.com/user234683/youtube-local"
license=('AGPL3')
depends=('python-flask>=1.0.3' 'python-gevent>=1.2.2' 'brotli>=1.0.7' 'python-pysocks>=1.6.8' 'python-urllib3>=1.24.1' 'python-defusedxml>=0.5.0' 'python-cachetools>=4.0.0' 'python-stem>=1.8.0')
makedepends=('git')
optdepends=('python-pytest: development requirement')
provides=(youtube-local)
replaces=(youtube-local)
_commit=0e5ffd5ce35a611382d47834bdbf06abd41bae53
source=("youtube-local-$_commit.zip"::"https://github.com/user234683/youtube-local/archive/$_commit.zip"
        youtube-local.service)
install=youtube-local.install
sha512sums=(4bfefc7f7ad997e20bdd3384948001dba7791cc56ee67bfe6ed7d4915cf2e84464f78d1423a0be2c5b0183230c85a1750fcdf2d8eb6bd91791ed1b14d7691b84
            9c7318b3e8fbcb3947301ff8a3060dde2d8b4c404c4aa486ac92e20264bbbefca2eba61414b7cb4905a4433c7dae8eb540cc65945980ba766c1f0c68fa9d9425)

package() {

  cd $srcdir/youtube-local-$_commit
  rm run.bat
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/youtube-local/LICENSE"
  mkdir -p ${pkgdir}/opt/youtube-local/
  cp -r * ${pkgdir}/opt/youtube-local/
    
  mkdir -p ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 ${srcdir}/youtube-local.service ${pkgdir}/usr/lib/systemd/user/
}
