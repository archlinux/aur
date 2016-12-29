# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gitea
pkgver=1.0.0
pkgrel=2
pkgdesc='Git with a cup of tea, forked from Gogs. Is a Self Hosted Git Service in the Go Programming Language.'
arch=('x86_64' 'i686')
url='http://gitea.io'
license=('MIT')
depends=('git' 'go>=1.6')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'pam: Authentication via PAM support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
makedepends=('go>=1.6' 'git')
conflicts=('gitea-git' 'gitea-git-dev')
options=('emptydirs')
backup=('etc/gitea/app.ini')
source=(https://github.com/go-gitea/gitea/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-amd64
        gitea.service
        app.ini)
sha512sums=('b1b415b6f513290e46ac6515bdfefa199fdc6485b0c1b8174955b656e95612bd37d9d1c005e1e6451561a3ffdb419c8807062fbedc6a6806e3bab8bc4c69eceb'
            '692ea79b3195f3222f69b485f8a7905223fa457dc5cb2b480edbac6f480ac4f74075accb04ae0c17b90e98e41f53224e661a85762310d7263921e763cb3fc257'
            '4652e99597b8f3bb4ab8f9ec4e6e32ff8b5f6a3a365f6b0a0af57c19f18b29b6eb1985bc99dd72b7ded2ca12eb5cd24d56daca4956bddd5ab808cb57c0bb52fe')

package() {
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/
  install -o git -g git -d -m 750 ${pkgdir}/var/lib/gitea/{repos,tmp,sessions,attachments,public,data}
  install -o git -g git -d -m 750 ${pkgdir}/var/log/gitea/

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}-linux-amd64 ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/gitea.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 ${srcdir}/app.ini ${pkgdir}/etc/gitea/app.ini
}
