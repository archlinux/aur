# Maintainer: Matt Schultz <matt@qmxtech.com>
# Contributor: Brent Saner <r00t (at) square-r00t (dot) net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('071C6FAFDA426F1F3984C488E56023217FBB112D')

# This builds the FreeSWITCH open source telephone engine
# from the freeswitch git.  It enables the following modules
# not enabled in the standard freeswitch build:
#  * mod_callcenter
#  * mod_xml_curl
# And disables the following standard modules:
#  * mod_dialplan_asterisk
#  * mod_say_ru
#  * mod_spidermonkey
#  * mod_lua
# You can modify this and other options in the BUILD CONFIGURATION section below
# MANY thanks to Mike Jerrit at Freeswitch (<mike (at) freeswitch (dot) org>|<mike (at) jerris (dot) com>)
# for providing some cleanup and build assistance!


# BUILD CONFIGURATION BEGINS #
# SET THIS TO GET HIGHER QUALITY SOUNDFILES
# Value can be "hd-", "uhd-", or "cd-" to get 16k, 32k, or 48k sounds.
# By default we only download the 8k sounds. If you only use g711 or
# 8k codecs, leave this as-is

_sounds="cd-"

# ADDED MODULES
# If you don't need/want these modules remove them from _enabled_modules
# You can add any modules here you wish to add, make sure they're not
# in _disabled_modules, though
#
# xml_int/mod_xml_curl - Remote http dialplan lookups/control
# xml_int/mod_xml_cdr - Remote http dialplan lookups/control
# applications/mod_callcenter - Inbound call queueing system
_enabled_modules=(xml_int/mod_xml_curl
                  xml_int/mod_xml_cdr
                  formats/mod_shout
                  applications/mod_callcenter
                  applications/mod_abstraction
                  applications/mod_amvd
                  applications/mod_bert
                  applications/mod_blacklist
                  applications/mod_cidlookup
                  applications/mod_curl
                  #applications/mod_cv			# requires aur/opencv2
                  applications/mod_directory
                  applications/mod_distributor
                  applications/mod_dptools
                  applications/mod_easyroute
                  applications/mod_esl
                  applications/mod_fsk
                  #applications/mod_hiredis		# requires community/hiredis
                  applications/mod_http_cache
                  #applications/mod_ladspa		# requires extra/ladspa
                  applications/mod_lcr
                  #applications/mod_memcache		# requires community/libmemcached-awesome
                  #applications/mod_mongo		# requires community/mongo-c-driver
                  #applications/mod_mp4			# requires extra/libmp4v2
                  #applications/mod_mp4v2		# requires extra/libmp4v2
                  applications/mod_nibblebill
                  applications/mod_oreka
                  #applications/mod_osp			# requires OSP Toolkit from TransNexus http://www.transnexus.com/index.php/osp-toolkit
                  applications/mod_prefix
                  #applications/mod_rad_auth		# requires core/libnsl
                  applications/mod_redis
                  applications/mod_rss
                  #applications/mod_signalwire		# requires signalwire C library https://github.com/signalwire/signalwire-c
                  #applications/mod_sms_flowroute       # requires aur/h2o and flowroute account, see https://blog.flowroute.com/2016/07/28/flowroute-sms-in-freeswitch/
                  applications/mod_snapshot
                  #applications/mod_snom		# Useful for controlling the functionality and appearance of the programmable softkeys on a Snom phone. Unnecessary otherwise.
                  applications/mod_sonar
                  #applications/mod_soundtouch		# requires extra/soundtouch
                  applications/mod_spy
                  applications/mod_stress
                  applications/mod_translate
                  applications/mod_video_filter
                  applications/mod_voicemail_ivr
                  #asr_tts/mod_cepstral			# requires cepstral https://www.cepstral.com/; do not enable mod_cepstral and mod_flite together.
                  #asr_tts/mod_flite			# requires community/flite; may need to be custom built
                  #asr_tts/mod_pocketsphinx		# requires extra/libpulse, extra/libsamplerate
                  asr_tts/mod_tts_commandline
                  asr_tts/mod_unimrcp
                  #codecs/mod_amrwb			# requires aur/vo-amrwbenc
                  #codecs/mod_bv			# requires BroadVoice: https://docs.broadcom.com/docs/12358448 and https://docs.broadcom.com/docs/12358447
                  codecs/mod_clearmode
                  #codecs/mod_codec2			# requires community/codec2
                  #codecs/mod_com_g729			# do not enable mod_com_g729 and mod_g729 together.
                  codecs/mod_g729
                  codecs/mod_dahdi_codec
                  #codecs/mod_ilbc			# requires signalwire's fork of libilbc: https://github.com/signalwire/libilbc
                  codecs/mod_isac
                  codecs/mod_mp4v
                  #codecs/mod_sangoma_codec		# requires Sangoma transcoding cards
                  #codecs/mod_silk			# requires libsilk: https://freeswitch.org/stash/projects/SD/repos/libsilk/browse
                  #codecs/mod_siren			# requires libg7221: https://github.com/juha-h/libg7221
                  codecs/mod_theora
                  #dialplans/mod_dialplan_asterisk	# use asterisk dialplan formatting instead of the default
                  dialplans/mod_dialplan_directory
                  #directories/mod_ldap			# requires core/libldap
                  endpoints/mod_alsa
                  endpoints/mod_dingaling
                  #endpoints/mod_gsmopen		# requires an unlocked GSM dongle; see https://freeswitch.org/confluence/display/FREESWITCH/mod_gsmopen
                  #endpoints/mod_khomp			# endpoint module for khomp boards.
                  #endpoints/mod_opal			# requires aur/opal
                  #endpoints/mod_portaudio		# requires extra/portaudio
                  endpoints/mod_rtc
                  endpoints/mod_rtmp
                  #endpoints/mod_verto                  # requires libks https://github.com/signalwire/libks
                  #event_handlers/mod_amqp		# requires community/librabbitmq-c
                  event_handlers/mod_cdr_mongodb
                  event_handlers/mod_cdr_pg_csv
                  #event_handlers/mod_erlang_event	# requires community/erlang
                  event_handlers/mod_event_multicast
                  event_handlers/mod_fail2ban
                  event_handlers/mod_format_cdr
                  event_handlers/mod_json_cdr
                  #event_handlers/mod_radius_cdr	# requires core/libnsl
                  event_handlers/mod_odbc_cdr
                  event_handlers/mod_rayo
                  #event_handlers/mod_smpp		# requires aur/libsmpp34-git
                  #event_handlers/mod_snmp		# requires extra/net-snmp
                  event_handlers/mod_event_zmq
                  #formats/mod_imagick			# requires extra/imagemagick
                  #formats/mod_portaudio_stream		# requires extra/portaudio
                  formats/mod_shell_stream
                  formats/mod_ssml
                  #formats/mod_vlc			# requires extra/vlc
                  #formats/mod_opusfile			# requires community/libopusenc, community/opusfile
                  languages/mod_basic
                  #languages/mod_java			# requires a Java Development Kit at build-time, a Java Runtime Environment at runtime
                  languages/mod_lua
                  #languages/mod_perl			# requires core/perl
                  languages/mod_python3
                  #languages/mod_v8			# requires aur/v8-6.8
                  #languages/mod_yaml			# requires extra/libyaml
                  loggers/mod_graylog2
                  loggers/mod_raven
                  say/mod_say_de
                  say/mod_say_es
                  say/mod_say_en
                  timers/mod_posix_timer
                  timers/mod_timerfd
                  #xml_int/mod_xml_ldap			# requires core/libldap
                  #xml_int/mod_xml_radius		# requires core/libnsl
)

# DISABLED MODULES
# Remove from _disabled_modules if you want to build these
#
# languages/mod_spidermonkey - server-side javascript
# languages/mod_lua - server-side lua
# say/mod_say_ru - Russian phrases
# dialplans/mod_dialplan_asterisk - Legacy dialplan
# applications/mod_signalwire - https://freeswitch.org/confluence/display/FREESWITCH/mod_signalwire (requires libks which isn't even packaged)
# endpoints/mod_verto - also requires libks
_disabled_modules=(languages/mod_spidermonkey
                   say/mod_say_ru
#                   dialplans/mod_dialplan_asterisk
                   applications/mod_signalwire
                   endpoints/mod_verto
)
# BUILD CONFIGURATION ENDS                     #

pkgname=freeswitch
pkgver=1.10.8
pkgrel=1
pkgdesc="An opensource and free (libre, price) telephony system, similar to Asterisk."
arch=('i686' 'x86_64')
url="http://freeswitch.org/"
license=('MPL')
depends=('curl'
         'xz'
         'python'
         'libtheora'
         'unixodbc'
         'libvorbis'
         'speex'
         'libjpeg-turbo'
         'postgresql-libs'
         'libshout'
         'libtiff'
         'lua'
         'ffmpeg4.4'
         'openssl'
         'opus'
         'freetype2'
         'spandsp-fs'
         'sofia-sip-fs')
# per https://wiki.freeswitch.org/wiki/FreeSwitch_Dependencies, dependencies are downloaded and built *from upstream*, so thankfully the deps are pretty minimal.
makedepends=('git'
             'libjpeg'
             'ldns'
             'libedit'
             'curl'
             'python'
             'unixodbc'
             'sed'
             'make'
             'libyuv'
             'yasm'
             'mpg123'
             'lame'
             'libsndfile')
# per https://aur.archlinux.org/packages/freeswitch-fixed/ 2014-08-13 14:02 comment, enable this when freetdm is packaged.
# freetdm will require libsangoma, wanpipe, libsng_isdn, libpri. see http://wiki.freeswitch.org/wiki/FreeTDM#Dependencies ; links below
# http://wiki.sangoma.com/wanpipe-linux-drivers
# http://downloads.asterisk.org/pub/telephony/libpri/releases
#optdepends=('freetdm: FreeTDM support for DAHDI etc.') 
provides=('freeswitch')
conflicts=('freeswitch-git'
           'freeswitch-fixed')
install=freeswitch.install
backup=('etc/freeswitch/private/passwords.xml'
        'etc/freeswitch/vars.xml')
#source=("git+https://stash.freeswitch.org/scm/fs/freeswitch.git#tag=v${pkgver}"
source=("https://github.com/signalwire/${pkgname}/archive/v${pkgver}.tar.gz"
        'freeswitch.conf.d'
         'README.freeswitch'
         'run.freeswitch'
         'run_log.freeswitch'
         'conf_log.freeswitch'
         'freeswitch.service'
	 'freeswitch-arch.patch'  # required for 1.6.17
         'apr-nsig-fix.patch'
         'python-3.10.patch'
         'fix-zmq-url.patch'
         'freeswitch.conf.d.sig'
         'README.freeswitch.sig'
         'run.freeswitch.sig'
         'run_log.freeswitch.sig'
         'conf_log.freeswitch.sig'
         'freeswitch.service.sig'
	 'freeswitch-arch.patch.sig'
         'apr-nsig-fix.patch.sig'  # required for 1.6.17
         'python-3.10.patch.sig'
         'fix-zmq-url.patch.sig' )
_pkgname="freeswitch"
sha512sums=('SKIP'
            'a9c0f8397e9375b26f8c3950c07fff9ce2c60684bd99cfb371cd19cce2bfb2f042a5380a38751bcd212096611d38731a2613a93d037b53f0c1cf356180b98912'
            '55e913bae6d3bb04ae9253989e40b6e0c3bfcecf95c28c904f5022ed218227c68530aaa60f99d7486469c95f9c1719da041a8fef82bf4ee54b1f901c443d347d'
            '6d8a3080b73918fb4a10e077758726b8b8e917c6b6f9d3c11c3b81e14e2efb43cd6fdf87d86f81a9e374811ca0d555eaa901113795c9334104de5e1309458da7'
            'e0ad57847905d11540567512fb224587a96db086ecaefd949964bd7e5bf29e448497fb3d6df5d88dbedd69beb5ae4618bb0e8462cbbb9fad84947c6932fc0b46'
            'a4fd539de109de3475abfeb2bd8a95670af3f5af83bd6f6b229df19e81da3f121c28a62cff282f9dc152908ebe0f24f76743e00c72fa04dc1fd465a00dc6f976'
            '0d71a056de156f5840effabf6fb37a20e64ae011ecd48bf049886d4c073fe251cd6adeb0380784622b570948e1ca30ce7c92a2cade230a7177c97ed697e6f1cb'
	    '4d4f5237297b298010b8a0b264435cc2c04742ca313272e7558f164b19aef97afaace5cf005eeffcfa6be096daedace67931cc209bccdabd2f3d01a42b643036'
            'dd23352fe208b1c7f36ff6dec9ff8288795f99448273e5ec38fd44deb3eb37a8756ad55225bce31f464e3ae43afe4c38883d64f251bc3f0c529890009a3324e9'
            '4739be0c1c6783ace2bd10f7573b1ca86be013d21a7f973b5fd348c98fb9ed1a548baacee6bb65b7501251106c8dbd7266997f8699d2d7070a2bd7efe145b866'
            'cf55641654538af737246f9c838b98c081cf4b00e5713b821b86e0fc02df7b6605ea26fed9b5e9d3740a7766ac33d6effec324d3cc9ed6a7d6faeb9ba744f35f'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


_pathorig=${PATH}

enable_module() {
  _fs_mod=${1}
  sed -i -e "s|^#${_fs_mod}|${_fs_mod}|" modules.conf
}

disable_module() {
  _fs_mod=${1}
  sed -i -e "s|^${_fs_mod}|#${_fs_mod}|" modules.conf
}

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  patch -Np1 -i ../apr-nsig-fix.patch
  patch -Np1 -i ../python-3.10.patch
  patch -Np1 -i ../fix-zmq-url.patch

  # BUILD BEGINS
  msg "Bootstrapping..."
  ./bootstrap.sh ${_concurrent} > /dev/null
  msg "Bootstrap Complete"

  # MODULE ENABLE/DISABLE
  for _mod in ${_enabled_modules[@]};do
    msg "Enabling ${_mod}"
    enable_module ${_mod}
  done

  for _mod in ${_disabled_modules[@]};do
    msg "Disabling ${_mod}"
    disable_module ${_mod}
  done

  msg "Module Configuration Complete, Stop Now with Ctrl-C if the above is not correct"
  sleep 5

  # CONFIGURE
  # We need to override some things for the ./configure for 1.6.17
  #./configure \
  export CFLAGS="${CFLAGS} -Wno-error -D__alloca=alloca -I/usr/include/python3.10" # -I/usr/include/ffmpeg4.4"
  export CXXFLAGS="${CFLAGS}"
  PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" \
  ./configure \
    --prefix=/var/lib/freeswitch \
    --bindir=/usr/bin \
    --sbindir=/usr/sbin \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --datarootdir=/usr/share \
    --libexecdir=/usr/lib/freeswitch \
    --libdir=/usr/lib/freeswitch \
    --includedir=/usr/include/freeswitch \
    --enable-core-odbc-support \
    --with-recordingsdir=/var/spool/freeswitch/recordings \
    --with-dbdir=/var/spool/freeswitch/db \
    --with-pkgconfigdir=/usr/lib/pkgconfig \
    --with-logfiledir=/var/log/freeswitch \
    --with-modinstdir=/usr/lib/freeswitch/mod \
    --with-scriptdir=/usr/share/freeswitch/scripts \
    --with-certsdir=/etc/freeswitch/certs \
    --with-rundir=/run/freeswitch

    #patch -Np1 < ../freeswitch-arch.patch  # needed for 1.6.17
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # COMPILE
  # https://freeswitch.org/jira/browse/FS-11345
  export CFLAGS="${CFLAGS} -Wno-error -D__alloca=alloca"
  export CXXFLAGS="${CFLAGS}"
  make

}

enable_mod_xml() {
  _fs_mod=$(basename $1)

  if [ "x$(grep ${_fs_mod} ${pkgdir}/etc/freeswitch/autoload_configs/modules.conf.xml)" == "x" ];then
    msg "Adding missing module ${_fs_mod} to modules.conf.xml"
    sed -i -e "s|^\(\s*</modules>\)|\t\t<\!-- added by archlinux package -->\n\t\t<load module=\"${_fs_mod}\"/>\n\1|" \
      "${pkgdir}/etc/freeswitch/autoload_configs/modules.conf.xml"
  else
    msg "Enabling module ${_fs_mod} in modules.conf.xml"
    sed -i -e "s|^\(\s*\)<\!--\s*\(<load module=\"${_fs_mod}\"/>\)\s*-->|\1\2|" \
      "${pkgdir}/etc/freeswitch/autoload_configs/modules.conf.xml"
  fi

}

disable_mod_xml() {
  _fs_mod=$(basename $1)
  msg "Disabling module ${_fs_mod} in modules.conf.xml"
  sed -i -e "s|^\(\s*\)\(<load module=\"${_fs_mod}\"/>\)|\1<\!-- \2 -->|" \
    "${pkgdir}/etc/freeswitch/autoload_configs/modules.conf.xml"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  make DESTDIR="${pkgdir}/" ${_sounds}moh-install
  make DESTDIR="${pkgdir}/" ${_sounds}sounds-install

  cd ${pkgdir} # MUY IMPORTANT, $PWD is $pkgdir from here on out
  # Mangle freeswitch's installed dirs into a more compliant structure,
  # leaving symlinks in their place so freeswitch doesn't notice.
  ln -sf /var/log/freeswitch var/lib/freeswitch/log
  ln -sf /var/spool/freeswitch/db var/lib/freeswitch/db
  ln -sf /var/spool/freeswitch/recordings var/lib/freeswitch/recordings
  install -D -m 0755 -d var/spool/freeswitch/storage && \
    ln -sf /var/spool/freeswitch/storage var/lib/freeswitch/storage
  rm usr/lib/freeswitch/mod/*.la 2>/dev/null|| true
  rm usr/lib/freeswitch/*.la 2>/dev/null || true
  ln -sf /usr/lib/freeswitch/mod var/lib/freeswitch/mod
  install -D -m 0644 ${srcdir}/freeswitch.service usr/lib/systemd/system/freeswitch.service
  install -D -m 0644 "${srcdir}/freeswitch.conf.d" etc/conf.d/freeswitch
  install -D -m 0644 "${srcdir}/README.freeswitch" usr/share/doc/freeswitch/README
  cp -a "${srcdir}/${_pkgname}-${pkgver}/docs" usr/share/doc/freeswitch
  install -D -m 0755 -d usr/share/doc/freeswitch/support-d
  cp -a "${srcdir}/${_pkgname}-${pkgver}/support-d" usr/share/doc/freeswitch/
  install -D -m 0755 -d usr/share/freeswitch/scripts
  cp -a "${srcdir}/${_pkgname}-${pkgver}/scripts" usr/share/freeswitch/.
  # Copy upstream confs 
  install -D -m 0755 -d usr/share/doc/freeswitch/examples/conf.default
  install -D -m 0755 -d usr/share/doc/freeswitch/examples/conf.archlinux
  mkdir etc/freeswitch/private
  echo '<X-PRE-PROCESS cmd="include" data="private/passwords.xml"/>' >> etc/freeswitch/vars.xml
  echo "<X-PRE-PROCESS cmd=\"set\" data=\"default_password=$(tr -dc 0-9 < /dev/urandom | head -c10)\"/>" > etc/freeswitch/private/passwords.xml
  chmod 700 etc/freeswitch/private
  chmod 600 etc/freeswitch/private/passwords.xml
  ln -sf /etc/freeswitch var/lib/freeswitch/conf
  cp -a etc/freeswitch/* usr/share/doc/freeswitch/examples/conf.default/
  install -d -m 0755 etc/freeswitch/certs

  for _mod in ${_enabled_modules[@]};do
    enable_mod_xml $_mod
  done

  for _mod in ${_disabled_modules[@]};do
    disable_mod_xml $_mod
  done

  mv etc/freeswitch/* usr/share/doc/freeswitch/examples/conf.archlinux/
  rmdir etc/freeswitch
  install -D -m 0755 -d usr/share/freeswitch/conf
  install -D -m 0755 "${srcdir}/run.freeswitch" usr/share/freeswitch/run
  install -D -m 0755 "${srcdir}/run_log.freeswitch" usr/share/freeswitch/log/run
  install -D -m 0644 "${srcdir}/conf_log.freeswitch" usr/share/freeswitch/log/conf

  # Fix scripts' path
  cd ${pkgdir}/usr/share/freeswitch/scripts
  rm -rf applescript
  rm FreeSWITCH-debian-raspbian-installer.sh
  for i in $(find ./ -type f);
  do
    sed -i -r \
      -e 's@/usr/local/s?bin/@/usr/bin/@g' \
      -e 's@/usr/local/freeswitch/certs@/etc/freeswitch/certs@g' \
      -e 's@/usr/local/freeswitch/run/@/run/freeswitch@g' \
      -e 's@/usr/local/freeswitch/log@/var/log@g' \
      -e 's@/usr/local/freeswitch/bin@/usr/bin@g' \
      -e 's@/usr/local/freeswitch/conf@/etc/freeswitch@g' "${i}"
  done
} 
