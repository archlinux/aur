# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sogo6-server
pkgver=6.0.0alpha2
pkgrel=2
pkgdesc="API server of SOGo 6, the groupware for mail, calendars and contacts (alpha, not for production)"
arch=(any)
url="https://github.com/Alinto/SOGo6-server"
license=(GPL-3.0-or-later)
# What app/ imports. Upstream also lists pytest-mock and types-smorest, which only the tests and the
# type checks use.
depends=(
  gunicorn
  python
  python-argon2-cffi
  python-celery
  python-click
  python-cryptography
  python-flask
  python-flask-compress
  python-flask-cors
  python-flask-smorest
  python-icalendar
  python-ldap
  python-marshmallow
  python-mysql-connector
  python-passlib
  python-psycopg
  python-pydantic-settings
  python-pyjwt
  python-redis
  python-sievelib
  python-webargs
  python-werkzeug
  python-yarl
  # celery's, which the AUR's python-celery 5.6.3-1 lacks: drop them once it has them
  python-dateutil
  python-tzlocal
  # sievelib's, which the AUR's python-sievelib 1.5.0-1 lacks: drop it once it has it
  python-typing_extensions
)
checkdepends=(python-pytest python-pytest-mock)
optdepends=('valkey: the cache and the broker of the agent, when it runs on the same host'
  'postgresql: database server, when it runs on the same host'
  'mariadb: database server, when it runs on the same host'
  'openldap: directory server, when it runs on the same host'
  'dovecot: IMAP and Sieve server, when it runs on the same host'
  'postfix: SMTP server, when it runs on the same host'
  'sogo6-ui: the web interface'
  'nginx: reverse proxy for the API and the web interface')
backup=(etc/sogo6/process.conf)
_tag="v${pkgver/alpha/-alpha}"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
  process.conf
  check-settings.py
  agent.py
  sogo6.service
  sogo6-agent.service
  sogo6-agent-beat.service
  sogo6.sysusers
  sogo6.tmpfiles)
sha512sums=('048e2500e25ebaab1f0adfa6ca131a22bb96434a529be5aac5081d2e2a2fe09641594887735ee2282700bd851d438f0727e0efb24a99569a044a7ec9e0e8c7b8'
  '980e351d8d06c09fd5adc63a88383be135646a898cd6af4fdf40a1bfe96edd63e96ae5d13b8e7e796b1c6965b32a34b613fc99557d291d73128cc79ad9ba33a5'
  'b8a7e4aa3be656c794d4c9adc50fecdcabd53a4048439cb166d113db3a755669d839b059d41f1b5cacf18f68de4c98e2db146a09acd2a4c756184328cee59b8c'
  'f7818647bbf314d69b1bca40e0b15eb79d4f91bfe6c1b2bdd23d7a18041978feda47e4d825990b0b0ee7cb20cb08c6f5de2fd7bc894f3817367f44d47b086b5c'
  '0d37b05b92a0cf5a64fdda0a8bda92ca0f7951a36bb395fefd4bca44090964712638bcbbce6ae128056f6d75af7a92b849d900b0e0ebf8630d2d5ec649ff6526'
  'f0b8a93d50742b99fbd78e1d8485de4b6ebd393812ac54363d9e6df127c479c08e4a6938fe0a0a910cecc338162fa8228022672f85b14db330ea039b435dd2c0'
  '9dddc27f6cc00723a9dcee4b5103d795ddc0e440bfeb980c99d6966da709c9089a50b72d2951d1c19ea8a6e93d7173d051e733cb1dfa51c82c7c6fa4f2cb1ed8'
  'b218ce6d0c031694acb09f06afb1a98f42ec735181841f5e3c35bc23885b4f5fd477eaacecbbfee58ffd5525a996700c20727f95a22ad8597ea4c4f2488bdba1'
  '7ffc993970ed53803755f165f9634ed4cebf68c411364469dadd2e3dd4fdf5b14505a6b2c7228f6e78973b2f57c1e2231a99f067a3112bcc30bb55645a5a4538')
b2sums=('79ec5851af8463db950819c7e2ec2529ab8239dcafc7bc8b33c7b6db3e23904c4946a41937d2ac96b7b99252622032b7e29a2ffd69e04c86903a513efddabdfd'
  '7759247806a7bd30a1dd49c3c4c15b630b21baef7fbe74c3693ba4be2c6f905f492c7fd5a23658faf647546e999e32fd4b4ea0350b079998c2348aa0a32661c2'
  'e44d05e6a8c764d232f3af27cf3dd25158b3db0e45358b0d32846908e2a11f6724868b87487f9a960a78316fbd394bcd5b77e008d251c59e0c26cb1cb1f47a65'
  '15ce00b27798f8ef71c9805cd7e2b206d48ae814740afd81fa35d94db6155957667f470eee51fbdda6431592fecad59604b726d0ddb8c3492f785eb96ce234be'
  'c2e6c775d4f5a2b710da353d8c3cec6991edb316aa8fe80ef1bcd7e361560701a2114a588856726c3d788f31b0badf4ea06101e8e2d0283cb891469a3fc962df'
  '73042213281f1f7f5227e9e20e038aac3d405738529ab84d5ee0d164254a95f6a56d990baead79f0ec5c1121dcc1758285b1f25b95cc112d7a099426ab7405e8'
  '7aa03020be3ac14cce09371c7e3475c2a77cbc67b35e0ade3b7899501433318828d8a5c7f240a66f6dba6f6916eb108c4eb0e083f30deafe7eae3e30572e71a4'
  '8a117dc6a69b32b1fcca64e30f45f0a274e50ed3723d9ad0a70921e50317586530b371609aaf5891a993eaf9459230854062f116b100d1d0e38d021dd5ae1b6f'
  '37ba3965ebf874b6e64879a0b74c545dcdeedc32936140fe25ad6c0694ce81b12431d1bc53d3a6fc6911a654dc019a9228fd2e2e1694457f085f6bf71b42621a')

build() {
  cd "SOGo6-server-${_tag#v}" || exit
  # The application isn't a wheel (see package()): its bytecode, with the paths it's installed to
  python -m compileall -q -o 0 -o 1 -s "$PWD" -p "/usr/share/$pkgname" app
}

check() {
  cd "SOGo6-server-${_tag#v}" || exit
  # The tests mock Redis, the databases, LDAP and the mail servers; the settings without a default
  # only have to be there
  SOGO_P_VOUCHER_SECRET=0123456789abcdef0123456789abcdef \
    SOGO_AES_ENC_KEY=MDEyMzQ1Njc4OWFiY2RlZjAxMjM0NTY3ODlhYmNkZWY= \
    SOGO_P_REDIS_URL=redis://localhost:6379/0 \
    python -m pytest -p no:cacheprovider tests
}

package() {
  cd "SOGo6-server-${_tag#v}" || exit

  # The application as upstream's container has it, outside of site-packages: its top-level package
  # is called app. gunicorn (--chdir) and the agent find it there.
  local _home=/usr/share/$pkgname
  install -dm 755 "$pkgdir$_home"
  cp -r app "$pkgdir$_home/"

  install -Dm 755 "$srcdir/agent.py" "$pkgdir/usr/lib/$pkgname/agent"
  install -Dm 755 "$srcdir/check-settings.py" "$pkgdir/usr/lib/$pkgname/check-settings"

  # The settings hold the secrets: systemd reads them for the services (EnvironmentFile=), as root
  install -Dm 600 "$srcdir/process.conf" "$pkgdir/etc/sogo6/process.conf"

  install -Dm 644 "$srcdir/sogo6.sysusers" "$pkgdir/usr/lib/sysusers.d/sogo6.conf"
  install -Dm 644 "$srcdir/sogo6.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/sogo6.conf"
  install -Dm 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir"/sogo6{,-agent,-agent-beat}.service

  # The examples of the settings of the first start (SOGO_INIT_*_SETTINGS_PATH), and the
  # documentation of the configuration
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/examples" scripts/init/{system,domain}_settings.json
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/admin/configuration.adoc
}
