# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tobias Hunger <tobias DOT hunger AT gmail DOT com>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=gitlab
pkgver=8.3.4
pkgrel=1
pkgdesc="Project management and code hosting application"
arch=('i686' 'x86_64')
url="http://gitlab.org/gitlab-ce"
license=('MIT')
depends=('ruby2.1' 'git>=1.7.10' 'ruby2.1-bundler>=1.5.2' 'gitlab-shell=2.6.9' 'openssh' 'redis>=2.8' 'libxslt' 'icu' 'nodejs')
makedepends=('cmake')
optdepends=(
	'gitlab-workhorse=0.5.4: for http(s) access'
	'mariadb: database backend'
	'postgresql>=9.1: database backend'
	'python2-docutils: reStructuredText markup language support'
	'postfix: mail server in order to receive mail notifications'
	)
backup=(
	"etc/webapps/${pkgname}/application.rb"
	"etc/webapps/${pkgname}/gitlab.yml"
	"etc/webapps/${pkgname}/database.yml"
	"etc/webapps/${pkgname}/resque.yml"
	"etc/webapps/${pkgname}/unicorn.rb"
	"etc/logrotate.d/${pkgname}"
	)
#source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/gitlab-org/gitlab-ce/repository/archive.tar.gz?ref=v${pkgver}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/gitlabhq/gitlabhq/archive/v${pkgver}.tar.gz"
	gitlab-unicorn.service
	gitlab-sidekiq.service
	gitlab-backup.service
	gitlab-mailroom.service
	gitlab-backup.timer
	gitlab.target
	gitlab.tmpfiles.d
	gitlab.logrotate
	apache.conf.example
	apache-ssl.conf.example
	apache2.2.conf.example
	apache2.2-ssl.conf.example
	nginx.conf.example
	nginx-ssl.conf.example
	lighttpd.conf.example)
install='gitlab.install'
sha512sums=('ce29dbd0b64eee3353e5ea335a738fd0ccc2910167d1d1c4849e7403b91a3b058edb037746b04988a780937abf4fbc33dd769f89a965ec99e8f7042478016f2e'
	'5dd7a940eee6a84095478af514dcc98c4fc6c4a214de1ddfa4a1e727d4ba34984d66d51affd7844ffebb75fed8f781b38a0da80fba6a5b8fa832948ab39b2249'
	'2c9d8c650a1808d730bb0f6c45ea8fe2f354d56a5bea1da7eb17dc687ec06b731472af842f4cce0704bf738b5a88001a06e1907d18a35d363e88c4dd6f3e9c7d'
	'c22439ee4cb34adf42de7619a2b83b02359cada38cbe99dd3031e6e72225ec4b2c2d6306331eadfc1c2044609b7a7e8bceddf7be213b5d4dbcaff86b35fe1ce7'
	'ba4266709079f57e4e3d0e37a46e4ba2cac793ce0a4ac18d2edfe0b7fed8104a3a75bdea2997404a8f363b8017f3be2792745bbdaebf0d09cf78f825a56b0928'
	'c11d2c59da8325551a465227096e8d39b0e4bcd5b1db21565cf3439e431838c04bc00aa6f07f4d493f3f47fd6b4e25aeb0fe0fc1a05756064706bf5708c960ec'
	'c519a51d31300074ea12594fbcc8e9610d991ef04b1dac94d93a2b201df3465999cc7c6ac7f3896e02b117c2366d61dea1ef2f6b9cd7b18998385a7f26e5700f'
	'7a0f649f030b24315cc97f23b704dd1879274304706cf1a1fa125772803a6e918a2fa249bed229b9384552a572452c56379c50f46d2fa8aa999dc71c1ee047e0'
	'a1f52d6ca36b32580062dede23ccdde5633238310b28c6c47deb2ce4496f4e5ffea0de2a49bcb1e0e38fc82b66b0cc91a5e86854716c7e848127769b43eb5067'
	'122ac76000c6ff251eecd9438180352d4be16ec2330594d3a84382e152ef0f69f822be6fc64bdcd6d66c9c9200fc4784b15562a8ac47094f9bf7dd04068eca8b'
	'403a53e9f8b1b337a47f388bc5bf1efb4c86d258f5df98b8adb1bff5db80c7eb0bbc0ec3a43657de53e735e8ae777c5f12bdc9282a352ce801c22e5cc20292f0'
	'33105cacb8ea125934c1bf6a0dba469c3921f4c7d9005794e009a465a022367380289f93fb9e6f148c13b4902b57726acc7702caf2c3f59a12c8a7158bb257d0'
	'013fb0d35ba50fe65ec3b9b54e01460a8156db6dcc44de306138d90e92390e2ec16c3e5e600d9b88bbe36bc54682245da4784d41617c0952dde79e4beb887f75'
	'e2cb969128b91eec6d435954dad3f3d76c6f6467d5a118043d530b7fdcf8657b1724abe406a20fc60702fcae4b5d02a0a3c782dcbc518db436a6c7bf874beb2f'
	'31d0ba225105f43f04befdf01cf8978b0cdfe4900d40e30c9427674b1ef70f534b44a8558a9474ae01b833f68d2e505f45faf9b70fdf2c8898b07cbb293ef779'
	'c78b6f46abcf603d8db6e38cf50868e14145928422ddfe17c88e2f006b5b910dddf456ec5d6d724b250994530643963809688a98f7e12ebd5b5dabf7f96f0e06')

_homedir="/var/lib/${pkgname}"
_datadir="/usr/share/webapps/${pkgname}"
_logdir="/var/log/${pkgname}"
_srcdir="gitlabhq-${pkgver}"
_etcdir="/etc/webapps/${pkgname}"
_wo=()

if [[ `pacman -T libmariadbclient` != '' ]]; then
	_wo+=('mysql')
else
    warning "detected libmariadbclient"
fi
if [[ `pacman -T postgresql-libs` != '' ]]; then
	_wo+=('postgres')
else
    warning "detected postgresql-libs"
fi

prepare() {
	if [[ ${#_wo[@]} == 2 ]]; then
		error "Usable DB libs not found"
		msg2 "Install at least libmariadbclient or postgresql-libs"
		return 1
	fi

	cd "${srcdir}/${_srcdir}"

	# Patching config files:
	msg2 "Patching paths and username in gitlab.yml..."
	sed -e "s|# user: git|user: gitlab|" \
		-e "s|/home/git/repositories|${_homedir}/repositories|" \
		-e "s|/home/git/gitlab-satellites|${_homedir}/satellites|" \
		-e "s|/home/git/gitlab-shell|/usr/share/webapps/gitlab-shell|" \
		-e "s|tmp/backups|${_homedir}/backups|" \
		config/gitlab.yml.example > config/gitlab.yml
	msg2 "Patching paths in unicorn.rb..."
	sed -e "s|/home/git/gitlab/tmp/.*/|/run/gitlab/|g" \
		-e "s|/var/run/|/run/|g" \
		-e "s|/home/git/gitlab|${_datadir}|g" \
		-e "s|timeout 30|timeout 300|" \
		-e "s|${_datadir}/log/|${_logdir}/|g" \
		config/unicorn.rb.example > config/unicorn.rb
	msg2 "Patching username in database.yml..."
	sed -e "s|username: git|username: gitlab|" \
		config/database.yml.mysql > config/database.yml
	sed -e "s|production: unix:/var/run/redis/redis.sock|production: redis://localhost:6379|" \
		config/resque.yml.example > config/resque.yml
	msg2 "setting up systemd service files ..."
	for __srv in gitlab-sidekiq.service gitlab-unicorn.service gitlab.logrotate gitlab.tmpfiles.d gitlab-backup.service gitlab-mailroom.service; do
		sed -i "s|<HOMEDIR>|${_homedir}|g" "${srcdir}/${__srv}"
		sed -i "s|<DATADIR>|${_datadir}|g" "${srcdir}/${__srv}"
		sed -i "s|<LOGDIR>|${_logdir}|g" "${srcdir}/${__srv}"
	done
}

build() {
	cd "${srcdir}/${_srcdir}"

	msg "Fetching bundled gems..."
	# Gems will be installed into vendor/bundle

	bundle-2.1 config build.nokogiri --use-system-libraries
	cpus=$(nproc)
	if [[ $cpus -ge 3 ]]; then
		bundle-2.1 install -j$(( $cpus - 1 )) --no-cache --deployment --without development test aws ${_wo[@]}
	else
		bundle-2.1 install --no-cache --deployment --without development test aws ${_wo[@]}
	fi
}

package() {
	cd "${srcdir}/${_srcdir}"
	install -d "${pkgdir}/usr/share/webapps"
	cp -r "${srcdir}/${_srcdir}" "${pkgdir}${_datadir}"

	# Creating directories
	install -d \
		"${pkgdir}${_etcdir}" \
		"${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgdir}${_homedir}/www" \
		"${pkgdir}${_homedir}/satellites" \
		"${pkgdir}${_datadir}/www"
	ln -fs /run/gitlab "${pkgdir}${_homedir}/pids"
	ln -fs /run/gitlab "${pkgdir}${_homedir}/sockets"
	ln -fs ${_datadir}/log "${pkgdir}${_homedir}/log"

	ln -fs "${_etcdir}/secret" "${pkgdir}${_datadir}/.secret"

	rm -rf "${pkgdir}${_datadir}/public/uploads" && ln -fs "${_homedir}/uploads" "${pkgdir}${_datadir}/public/uploads"
	rm -rf "${pkgdir}${_datadir}/public/assets" && ln -fs "${_homedir}/assets" "${pkgdir}${_datadir}/public/assets"
	# We are using PrivateTmp=true to start unicorn, so this is safe:
	rm -rf "${pkgdir}${_datadir}/tmp" && ln -fs /var/tmp "${pkgdir}${_datadir}/tmp"
	rm -rf "${pkgdir}${_datadir}/log" && ln -fs "${_logdir}" "${pkgdir}${_datadir}/log"

	ln -fs /etc/webapps/gitlab-shell/secret "${pkgdir}${_datadir}/.gitlab_shell_secret"

	# Install config files
	for _file in application.rb gitlab.yml unicorn.rb database.yml resque.yml; do
		mv "config/${_file}" "${pkgdir}${_etcdir}/"
		[[ -f "${pkgdir}${_datadir}/config/${_file}" ]] && rm "${pkgdir}${_datadir}/config/${_file}"
		ln -fs "${_etcdir}/${_file}" "${pkgdir}${_datadir}/config/"
	done

	# Install license and help files
	mv README.md MAINTENANCE.md CONTRIBUTING.md CHANGELOG config/*.{example,mysql,postgresql} "${pkgdir}/usr/share/doc/${pkgname}"
	install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm "${pkgdir}${_datadir}/LICENSE"

	# https://gitlab.com/gitlab-org/gitlab-ce/issues/765
	cp -r "${pkgdir}${_datadir}/doc" "${pkgdir}${_datadir}/public/help"
	find "${pkgdir}${_datadir}/public/help" -name "*.md" -exec rm {} \;
	find "${pkgdir}${_datadir}/public/help/" -depth -type d -empty -exec rmdir {} \;

	# Install systemd service files
	for _file in gitlab-unicorn.service gitlab-sidekiq.service gitlab-backup.service gitlab-backup.timer gitlab.target gitlab-mailroom.service; do
		install -Dm0644 "${srcdir}/${_file}" "${pkgdir}/usr/lib/systemd/system/${_file}"
	done

	install -Dm644 "${srcdir}/gitlab.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/gitlab.conf"
	install -Dm644 "${srcdir}/gitlab.logrotate" "${pkgdir}/etc/logrotate.d/gitlab"

	# Install webserver config templates
	for __cfg in apache apache-ssl apache2.2 apache2.2-ssl nginx nginx-ssl lighttpd; do
		install -m644 "${srcdir}/${__cfg}.conf.example" "${pkgdir}${_etcdir}"
	done
}

# vim:set ts=4 sw=4 et:
