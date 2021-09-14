# Maintainer: Atom Long <atom.long@hotmail.com>

pkgname=freenom
pkgver=20210910
pkgrel=1
pkgdesc='Freenom domain name renews automatically'
arch=('any')
url='https://github.com/luolongfei/next-freenom'
license=('MIT')
depends=('php')
backup=('etc/webapps/freenom/freenom.conf')
options=('!strip')
source=("git+${url}.git"
        'freenom.service'
		'freenom.timer')
sha512sums=('SKIP'
            'c00eb2e904efc369a2eb01dc81f4ebe06b1332fb8dff84a7c7a296af237c0929af8f0e7f23c152603be5f64b11cfbd769f82006e7621613022669f64ff25df20'
			'0d7b19b9d00d93ce71c29c30fc5613d820dfa783ace7bf222c7cc920a785545eda8bb8d41c1e04bd253953341d9893eab6faaeb89c423b8d31412551c436d1f5')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
  cd "$pkgdir"
  # create folders
  install -dm0755 usr/share/webapps usr/lib/systemd/system etc/webapps/freenom
  
  # app
  cp -a "${srcdir}/${pkgname}" usr/share/webapps/freenom
  
  # service
  install -Dm644 ${srcdir}/freenom.service usr/lib/systemd/system/freenom.service
  
  # timer
  install -Dm644 ${srcdir}/freenom.timer usr/lib/systemd/system/freenom.timer
  
  # config
  install -Dm0644 "${srcdir}/${pkgname}"/.env.example etc/webapps/freenom/freenom.conf
}

# vim:set ts=2 sw=2 et:
