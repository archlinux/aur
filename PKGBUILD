# Maintainer: Kimiblock Moe

pkgname=errands-git
pkgver=r2015.c37d711
pkgrel=1
pkgdesc='Todo application for those who prefer simplicity.'
arch=(x86_64 aarch64)
license=(MIT)
depends=(
	gtk4
	libadwaita
	libportal
	libical
	gtksourceview5
	json-glib
	curl
	libxml2
	webkitgtk-6.0
	cmark
)
url=https://github.com/mrvladus/Errands
makedepends=(meson ninja git cmake)
source=("git+https://github.com/mrvladus/Errands.git")
md5sums=(SKIP)

function pkgver() {
	cd "${srcdir}/Errands"
	#git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function prepare() {
	cd Errands
	git checkout rewrite-in-c
}

function build() {
	arch-meson Errands build
	meson compile -C build
}

function test() {
	meson test -C build
}

function package() {
	#meson install -C build --destdir "${pkgdir}"
	install -Dm755 build/errands "${pkgdir}/usr/bin/errands"
	install -Dm644 Errands/data/errands.gresource.xml "${pkgdir}/usr/share/errands/resources.gresource"
	install -d "${pkgdir}/usr/share/icons/hicolor/scalable"
	cp Errands/data/icons/* "${pkgdir}/usr/share/icons/hicolor/scalable"
	echo '''[Desktop Entry]
Name[ar]=إيراندس
Name[ca]=Tasques
Name[cs]=Pochůzky
Name[da_DK]=Opgaver
Name[de]=Errands
Name[en_GB]=Errands
Name[es]=Recados
Name[et]=Errands
Name[eu]=Errands
Name[fa]=مأموریت‌ها
Name[fr]=Errands
Name[hi]=Errands
Name[hr]=Errands
Name[hu]=Tennivalók
Name[ja]=Errands
Name[nb]=Errands
Name[nl]=Takenlijst
Name[oc]=Errands
Name[pt_BR]=Errands
Name[ru]=Дела
Name[sk_SK]=Pokyny
Name[tr]=Errands
Name[uk]=Errands
Name[zh_CN]=Errands
Name[el]=Εrrands
Name=Errands
Comment[ar]=أدر مهامك
Comment[ca]=Gestiona les teves tasques
Comment[cs]=Spravujte své úkoly
Comment[da_DK]=Administrér dine opgaver
Comment[de]=Verwalten Sie Ihre Aufgaben
Comment[en_GB]=Manage your tasks
Comment[es]=Administrar tareas
Comment[et]=Halda oma ülesandeid
Comment[eu]=Kudeatu zure zereginak
Comment[fa]=مدیریت تکلیف‌هایتان
Comment[fr]=Gérer vos tâches
Comment[hi]=अपने कार्यों का प्रबंधन करें
Comment[hr]=Upravljaj svojim zadacima
Comment[hu]=Kezelje a feladatait
Comment[it]=Gestisci le tue attività
Comment[ja]=タスクを管理
Comment[nb]=Fullfør gjøremålene dine
Comment[nl]=Beheer uw taken
Comment[oc]=Gerir vòstres prètzfaches
Comment[pl]=Zarządzaj swoimi zadaniami
Comment[pt_BR]=Gerencie suas tarefas
Comment[ru]=Управляйте своими задачами
Comment[sk_SK]=Spravujte svoje úlohy
Comment[tr]=Görevlerinizi yönetin
Comment[uk]=Керуйте вашими задачами
Comment[zh_CN]=管理您的任务
Comment[zh_TW]=管理待辦事項
Comment[el]=Διαχειριστείτε τις δουλειές σας
Comment=Manage your tasks
Exec=/usr/bin/errands
Icon=io.github.mrvladus.List
Terminal=false
Type=Application
Categories=GNOME;GTK;Utility;
Keywords[ar]=إيراندس؛مهمات؛قوائم؛مهمة؛مهام؛كال داف؛نكست كلاود؛مزامنة؛
Keywords[da_DK]=errands;tasks;list;todo;todos;caldav;nextcloud;sync;
Keywords[de]=errands;tasks;list;todo;todos;caldav;nextcloud;sync;Aufgaben;Liste;
Keywords[en_GB]=errands;tasks;list;todo;todos;caldav;nextcloud;sync;
Keywords[es]=recados;tareas;lista;todo;todos;caldav;nextcloud;sync;
Keywords[et]=errands;ülesanded;nimekiri;todo;caldav;nextcloud;sync;
Keywords[fa]=errands;tasks;list;todo;todos;caldav;nextcloud;sync;مأموریت;وظیفه;تکلیف;نکست‌کلود;همگام;
Keywords[fr]=errands;tâches;task;liste;todos;à faire;caldav;nextcloud;synchronisation;post it;
Keywords[hi]=errands;कार्य;सूची;कार्य सूची;caldav;nextcloud;समन्वयन;
Keywords[hr]=errands;zadaci;popis;popis zadataka;popisi zadataka;caldav;nextcloud;sinkronizacija;
Keywords[hu]=errands;tasks;list;todo;caldav;nextcloud;feladatok;tennivalók;szinkronizáció;
Keywords[it]=commissioni;attività;elenco;cosa da fare;cose da fare;caldav;nextcloud;sincronizzazione;
Keywords[ja]=errands;tasks;list;todo;todos;caldav;nextcloud;sync;用事;タスク;リスト;やることリスト;同期;
Keywords[nb]=errands;gjøremål;todo;list;caldav;nextcloud;sjekkliste;oppgaver;tasks;synkronisering;
Keywords[nl]=takenlijst;boodschappen;taken;lĳst;taak;todo;caldav;nextcloud;synchronisatie;synchroniseren;
Keywords[oc]=errands;tasks;list;todo;todos;prètzfaches;prètzfait;lista;tièra;caldav;nextcloud;sincro;sync;
Keywords[pt_BR]=recados;tarefas;lista;fazer;todos;caldav;nextcloud;sincronizar;
Keywords[ru]=errands;дела;задачи;лист;caldav;nextcloud;sync;
Keywords[sk_SK]=errands;tasks;list;todo;todos;caldav;nextcloud;sync;
Keywords[tr]=errands;görevler;görev;yapılacak;işler;caldav;nexcloud;sync;
Keywords[uk]=errands;tasks;list;todo;todos;caldav;nextcloud;sync;справи;туду;список;записати;задачі;синхронізація;некстклауд;нєкстклауд;кальдав;
Keywords[zh_CN]=errands;任务;列表;待办;todos;日历;nextcloud;同步;
Keywords[el]=errands;tasks;list;todo;todos;caldav;nextcloud;sync;
Keywords=errands;tasks;list;todo;todos;caldav;nextcloud;sync;
DBusActivatable=true
StartupNotify=true
X-GNOME-UsesNotifications=true
X-Purism-FormFactor=Workstation;Mobile;
X-Flatpak=io.github.mrvladus.List''' >io.github.mrvladus.List.desktop
	install -Dm644 io.github.mrvladus.List.desktop "${pkgdir}/usr/share/applications/io.github.mrvladus.List.desktop"
}
